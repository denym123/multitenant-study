import 'dart:io';

void main() async {
  final pbxprojFile = File('ios/Runner.xcodeproj/project.pbxproj');

  if (!pbxprojFile.existsSync()) {
    print('❌ Erro: ios/Runner.xcodeproj/project.pbxproj não encontrado.');
    exit(1);
  }

  print('🔍 Atualizando nomes dos catálogos de ícones no iOS...');

  String content = await pbxprojFile.readAsString();

  // 1. Descobrir flavors válidos
  final flavors = _getFlavors();
  if (flavors.isEmpty) {
    print('⚠️  Nenhum flavor encontrado em assets/flavors/');
    return;
  }
  print('   Flavors detectados: ${flavors.join(', ')}');

  // 2. Regex para encontrar blocos XCBuildConfiguration
  // Exemplo de bloco:
  /*
		97C147031CF9000F007C117D /* Debug-empresaADev */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				...
				ASSETCATALOG_COMPILER_APPICON_NAME = "";
				...
			};
			name = "Debug-empresaADev";
		};
  */

  // Expressão regular para capturar blocos XCBuildConfiguration
  // Trabalhamos com blocs individuais para garantir que alteramos a propriedade no contexto certo
  final blockRegex = RegExp(
    r'([A-Z0-9]+ /\* ([^*]+) \*/ = \{[^{]*isa = XCBuildConfiguration;[^{]*buildSettings = \{([^}]*)\};[^{]*name = "([^"]+)";[^{]*\};)',
    multiLine: true,
  );

  final matches = blockRegex.allMatches(content);
  int updatedCount = 0;

  String updatedContent = content;

  for (final match in matches) {
    final fullBlock = match.group(1)!;
    final configName = match.group(4)!;

    // Verificar se o configName termina com um de nossos flavors
    // Ex: "Debug-empresaADev" -> flavor "empresaADev"
    String? matchedFlavor;
    for (final flavor in flavors) {
      if (configName.endsWith('-$flavor') || configName == flavor) {
        matchedFlavor = flavor;
        break;
      }
    }

    if (matchedFlavor != null) {
      final oldSettings = match.group(3)!;

      // Se já tiver o ícone certo, pula
      if (oldSettings.contains(
        'ASSETCATALOG_COMPILER_APPICON_NAME = "AppIcon-$matchedFlavor";',
      )) {
        continue;
      }

      // Procura a linha do ícone e substitui
      // Pode ser que a linha não exista (caso raro em projetos Flutter padrão)
      String newSettings;
      if (oldSettings.contains('ASSETCATALOG_COMPILER_APPICON_NAME')) {
        final iconLineRegex = RegExp(
          r'ASSETCATALOG_COMPILER_APPICON_NAME = [^;]*;',
        );
        newSettings = oldSettings.replaceAll(
          iconLineRegex,
          'ASSETCATALOG_COMPILER_APPICON_NAME = "AppIcon-$matchedFlavor";',
        );
      } else {
        // Se a linha não existe, adicionamos no início do buildSettings para segurança
        newSettings =
            '\n\t\t\t\tASSETCATALOG_COMPILER_APPICON_NAME = "AppIcon-$matchedFlavor";$oldSettings';
      }

      if (oldSettings != newSettings) {
        final newBlock = fullBlock.replaceFirst(oldSettings, newSettings);
        // Usamos replaceFirst no fullBlock original para evitar problemas de recursão ou substituições erradas
        updatedContent = updatedContent.replaceFirst(fullBlock, newBlock);
        updatedCount++;
      }
    }
  }

  if (updatedCount > 0) {
    await pbxprojFile.writeAsString(updatedContent);
    print(
      '✅ Sucesso: $updatedCount build configurations atualizadas no pbxproj!',
    );
  } else {
    print('ℹ️ Nenhuma alteração necessária no pbxproj.');
  }
}

List<String> _getFlavors() {
  final flavorsDir = Directory('assets/flavors');
  if (!flavorsDir.existsSync()) return [];

  final flavors = <String>[];
  final tenants = flavorsDir
      .listSync()
      .whereType<Directory>()
      .where((d) => !d.path.split('/').last.startsWith('.'))
      .toList();

  for (final tenantDir in tenants) {
    final tenantName = tenantDir.path.split('/').last;
    final envs = tenantDir
        .listSync()
        .whereType<Directory>()
        .where((d) => !d.path.split('/').last.startsWith('.'))
        .toList();

    for (final envDir in envs) {
      final envName = envDir.path.split('/').last;
      final capitalizedEnv = envName.isEmpty
          ? ''
          : '${envName[0].toUpperCase()}${envName.substring(1)}';
      flavors.add('$tenantName$capitalizedEnv');
    }
  }
  return flavors;
}
