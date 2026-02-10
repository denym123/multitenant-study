import 'dart:io';

/// Capitalizes the first letter of a string
String capitalize(String s) =>
    s.isEmpty ? '' : '${s[0].toUpperCase()}${s.substring(1)}';

void main() async {
  final flavorsDir = Directory('assets/flavors');

  if (!flavorsDir.existsSync()) {
    print('❌ Erro: Pasta assets/flavors/ não encontrada.');
    exit(1);
  }

  print('🔍 Descobrindo tenants e ambientes...');

  final generatedFiles = <String>[];

  // Listar tenants (subpastas de assets/flavors)
  final tenants = flavorsDir
      .listSync()
      .whereType<Directory>()
      .where((d) => !d.path.split('/').last.startsWith('.'))
      .toList();

  for (final tenantDir in tenants) {
    final tenantName = tenantDir.path.split('/').last;

    // Listar ambientes (subpastas do tenant)
    final envs = tenantDir
        .listSync()
        .whereType<Directory>()
        .where((d) => !d.path.split('/').last.startsWith('.'))
        .toList();

    for (final envDir in envs) {
      final envName = envDir.path.split('/').last;
      final flavorName = '$tenantName${capitalize(envName)}';
      final fileName = 'flutter_launcher_icons-$flavorName.yaml';

      print('  📝 Gerando $fileName...');

      final content =
          '''
flutter_launcher_icons:
  android: true
  ios: true
  flavor: "$flavorName"
  remove_alpha_ios: true
  image_path: "assets/flavors/$tenantName/$envName/launch_icon.png"
  adaptive_icon_background: "assets/flavors/$tenantName/$envName/background.png"
  adaptive_icon_foreground: "assets/flavors/launch_icon_foreground.png"
  adaptive_icon_foreground_inset: 24
''';

      await File(fileName).writeAsString(content);
      generatedFiles.add(fileName);
    }
  }

  print('');
  print('⚙️  Executando flutter_launcher_icons...');
  print('');

  final result = await Process.run('dart', ['run', 'flutter_launcher_icons']);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  print('');
  print('🧹 Limpando arquivos de configuração temporários...');
  for (final file in generatedFiles) {
    final f = File(file);
    if (f.existsSync()) {
      await f.delete();
      print('  🗑️  Removido $file');
    }
  }

  print('');
  print('✅ Geração de ícones concluída!');
  print('   ${generatedFiles.length} configurações processadas.');
}
