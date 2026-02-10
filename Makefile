.DEFAULT_GOAL := help

## ------------------ VARIÁVEIS DE CONFIGURAÇÃO ------------------

# Para 'assets'
ASSETS_DIR := assets
OUTPUT_FILE := lib/shared/generated/assets.dart

# Para 'module' (o nome é passado via comando, ex: make module n=home)
MODULE_NAME=${n}

# Para 'build' (pode ser sobrescrito, ex: make build env=prd)
env ?= dev


## ------------------ COMANDOS DO PROJETO ------------------

.PHONY: clean assets module watch build bundle help
clean:
	@echo "🧹 Limpando o projeto e buscando dependências..."
	@flutter clean && flutter pub get
	@echo "✅ Limpeza concluída."

.PHONY: assets
assets:
	@echo "🔍 Buscando assets em '$(ASSETS_DIR)' (ignorando 'fonts' e 'flavors')..."
	@rm -f $(OUTPUT_FILE)
	@mkdir -p $(dir $(OUTPUT_FILE))
	@echo "// ATENÇÃO: Este arquivo é gerado automaticamente. Não edite manualmente." > $(OUTPUT_FILE)
	@echo "// Para atualizar, execute: make assets" >> $(OUTPUT_FILE)
	@echo "" >> $(OUTPUT_FILE)
	@echo "class AppAssets {" >> $(OUTPUT_FILE)
	@find $(ASSETS_DIR) -type f -not -path "*/fonts/*" -not -path "*/flavors/*" | sort | while read file; do \
		var_name=$$(echo "$$file" | sed -e 's|^$(ASSETS_DIR)/||' -e 's/\.[^.]*$$//' | awk 'BEGIN{FS="[/_-]"} {printf "%s", $$1; for(i=2;i<=NF;i++) printf "%s", toupper(substr($$i,1,1)) substr($$i,2)}'); \
		echo "  static const String $$var_name = '$$file';" >> $(OUTPUT_FILE); \
	done
	@echo "}" >> $(OUTPUT_FILE)
	@echo "✅ Arquivo de assets gerado com sucesso em '$(OUTPUT_FILE)'!"

.PHONY: l10n
l10n:
	@echo "🌐 Gerando arquivos de internacionalização (l10n)..."
	@flutter gen-l10n
	@echo "✅ Arquivos de tradução gerados com sucesso"

.PHONY: module
module:
	@if [ -z "$(MODULE_NAME)" ]; then \
		echo "❌ Erro: Você precisa informar o nome do módulo."; \
		echo "   Exemplo: make module n=auth_login"; \
		exit 1; \
	fi

	@echo "🛠️  Criando módulo '$(MODULE_NAME)'..."

	$(eval MODULE_DIR := lib/modules/$(MODULE_NAME))
	$(eval CAPITAL_CAMEL_CASE := $(shell echo $(MODULE_NAME) | awk -F '_' '{for(i=1;i<=NF;i++){printf toupper(substr($$i,1,1)) tolower(substr($$i,2))}}'))
	$(eval LOWER_CAMEL_CASE := $(shell echo $(MODULE_NAME) | awk -F '_' '{printf tolower(substr($$1,1,1)) tolower(substr($$1,2)); for(i=2;i<=NF;i++){printf toupper(substr($$i,1,1)) tolower(substr($$i,2))}}'))
	$(eval MODEL_NAME := $(CAPITAL_CAMEL_CASE)Model)

	@mkdir -p $(MODULE_DIR)/{controllers,repositories,widgets,mixins,dtos,models}

	@# Arquivo principal do módulo (barrel file)
	@echo "export 'controllers/controllers.dart';\nexport 'repositories/repositories.dart';\nexport 'mixins/mixins.dart';\nexport 'widgets/widgets.dart';\nexport 'dtos/dtos.dart';\nexport 'models/models.dart';\nexport '$(MODULE_NAME)_page.dart';\nexport '$(MODULE_NAME)_module.dart';" > $(MODULE_DIR)/$(MODULE_NAME).dart

	@# Arquivos de barrel internos
	@echo "export '$(MODULE_NAME)_controller.dart';" > $(MODULE_DIR)/controllers/controllers.dart
	@echo "export '$(MODULE_NAME)_repository.dart';\nexport '$(MODULE_NAME)_repository_impl.dart';" > $(MODULE_DIR)/repositories/repositories.dart
	@echo "export '$(MODULE_NAME)_variables.dart';" > $(MODULE_DIR)/mixins/mixins.dart
	@touch $(MODULE_DIR)/widgets/widgets.dart
	@touch $(MODULE_DIR)/dtos/dtos.dart
	@echo "export '$(LOWER_CAMEL_CASE)_model.dart';" > $(MODULE_DIR)/models/models.dart

	@# Arquivo de Model (Estrutura)
	@echo "class $(MODEL_NAME) {\n  const $(MODEL_NAME)();\n\n  // TODO: Defina as propriedades da sua Model\n}" > $(MODULE_DIR)/models/$(LOWER_CAMEL_CASE)_model.dart

	@# Arquivo de Mixin (Variables) - Importa shared com 3 níveis (../../..)
	@echo "import 'package:signals/signals_flutter.dart';" > $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "import '../../../shared/shared.dart';" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "import '../models/models.dart';" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "mixin $(CAPITAL_CAMEL_CASE)Variables {" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "  // TODO: Declare seus AsyncSignal, Computed e Signals aqui." >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "  // Ex: final itemsAS = AsyncSignal<List<$(MODEL_NAME)>>([]);" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart
	@echo "}" >> $(MODULE_DIR)/mixins/$(MODULE_NAME)_variables.dart

	@# Arquivo do Repository (Interface)
	@echo "import '../models/models.dart';" > $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart
	@echo "" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart
	@echo "abstract interface class $(CAPITAL_CAMEL_CASE)Repository {" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart
	@echo "  // TODO: Defina os métodos que o Controller irá usar." >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart
	@echo "  // Ex: Future<List<$(MODEL_NAME)>> fetchItems();" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart
	@echo "}" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository.dart

	@# Arquivo do Repository (Implementation) - Importa core com 3 níveis
	@echo "import '../../../core/core.dart';" > $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "import '../dtos/dtos.dart';" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "import '../models/models.dart';" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "import 'repositories.dart';" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "class $(CAPITAL_CAMEL_CASE)RepositoryImpl implements $(CAPITAL_CAMEL_CASE)Repository {" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  final HttpAdapter _httpAdapter;" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  $(CAPITAL_CAMEL_CASE)RepositoryImpl({required HttpAdapter httpAdapter}) : _httpAdapter = httpAdapter;" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  // TODO: Implemente os métodos definidos na interface" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  /*" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  @override" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  Future<List<$(MODEL_NAME)>> fetchItems() async {" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "    final response = await _httpAdapter.get('/caminho/do/endpoint');" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "    // Implemente a conversão DTO -> Model aqui" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "    return [];" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  }" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "  */" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart
	@echo "}" >> $(MODULE_DIR)/repositories/$(MODULE_NAME)_repository_impl.dart

	@# Arquivo do Controller - Importa barrel com "../" (sobe um nível)
	@echo "import 'package:flutter/material.dart';" > $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "import '../../../shared/shared.dart';" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "import '../$(MODULE_NAME).dart';" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "class $(CAPITAL_CAMEL_CASE)Controller with $(CAPITAL_CAMEL_CASE)Variables, ControllerLifeCycle {" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "  final $(CAPITAL_CAMEL_CASE)Repository _$(LOWER_CAMEL_CASE)Repository;" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "  $(CAPITAL_CAMEL_CASE)Controller({required $(CAPITAL_CAMEL_CASE)Repository $(LOWER_CAMEL_CASE)Repository})" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "    : _$(LOWER_CAMEL_CASE)Repository = $(LOWER_CAMEL_CASE)Repository;" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "  @override" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "  void onReady(BuildContext context) {" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "    super.onReady(context);" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "    // TODO: Inicie a primeira busca de dados ou a lógica inicial aqui." >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "  }" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart
	@echo "}" >> $(MODULE_DIR)/controllers/$(MODULE_NAME)_controller.dart

	@# Arquivo da Page - Importa barrel na mesma pasta (sem "../")
	@echo "import 'package:flutter/material.dart';" > $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "import 'package:signals/signals_flutter.dart';" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "import '../../shared/shared.dart';" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "import '$(MODULE_NAME).dart';" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "class $(CAPITAL_CAMEL_CASE)Page extends StatefulWidget {" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "  const $(CAPITAL_CAMEL_CASE)Page({super.key});" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "  @override" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "  State<$(CAPITAL_CAMEL_CASE)Page> createState() => _$(CAPITAL_CAMEL_CASE)PageState();" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "}" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "class _$(CAPITAL_CAMEL_CASE)PageState" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "    extends PageLifeCycleState<$(CAPITAL_CAMEL_CASE)Page, $(CAPITAL_CAMEL_CASE)Controller> {" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "  @override" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "  Widget build(BuildContext context) {" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "    return Scaffold(" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "      appBar: AppBar(title: Text('$(CAPITAL_CAMEL_CASE)'))," >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "      body: Center(" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "        child: Watch((context) {" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "          // TODO: Use controller.seuSignal.value.map() para gerenciar estados." >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "          return const Text('Página $(CAPITAL_CAMEL_CASE) pronta.');" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "        })," >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "      )," >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "    );" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "  }" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart
	@echo "}" >> $(MODULE_DIR)/$(MODULE_NAME)_page.dart

	@# Arquivo do Module (ProviderModule) - Importa barrel na mesma pasta (sem "../")
	@echo "import 'package:provider/provider.dart';" > $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "import '../../shared/shared.dart';" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "import '../../core/core.dart';" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "import '$(MODULE_NAME).dart';" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "class $(CAPITAL_CAMEL_CASE)Module extends ProviderModule {" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "  static const String path = '/$(MODULE_NAME)'; // TODO: Se necessário, ajuste a rota." >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "  $(CAPITAL_CAMEL_CASE)Module()" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "    : super(" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "        path: path," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "        page: const $(CAPITAL_CAMEL_CASE)Page()," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "        bindings: (_) => [" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "          // 1. Repository Implementation Binding (Injeta HttpAdapter)" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "          Provider<$(CAPITAL_CAMEL_CASE)Repository>(" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "            create: (context) => $(CAPITAL_CAMEL_CASE)RepositoryImpl(" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "              httpAdapter: context.read<HttpAdapter>()," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "            )," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "          )," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "          // 2. Controller Binding (Injeta a Interface do Repository)" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "          Provider(" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "            create: (context) => $(CAPITAL_CAMEL_CASE)Controller(" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "              $(LOWER_CAMEL_CASE)Repository: context.read<$(CAPITAL_CAMEL_CASE)Repository>()," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "              // TODO: Adicione outras dependências globais, como UserStore." >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "            )," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "          )," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "        ]," >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "      );" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart
	@echo "}" >> $(MODULE_DIR)/$(MODULE_NAME)_module.dart

	@# Adiciona a exportação no barrel principal de módulos
	@echo "export '$(MODULE_NAME)/$(MODULE_NAME).dart';" >> lib/modules/modules.dart

	@echo "✅ Módulo '$(MODULE_NAME)' criado com sucesso!"
	@git add .

.PHONY: watch
watch:
	@echo "🏃‍♂️ Iniciando o build_runner no modo watch (use Ctrl+C para parar)..."
	@fvm flutter pub run build_runner watch -d

.PHONY: build
build:
	@if [ "$(env)" != "dev" ] && [ "$(env)" != "hom" ] && [ "$(env)" != "prd" ]; then \
		echo "❌ Erro: O ambiente (env) deve ser 'dev', 'hom' ou 'prd'."; \
		echo "   Exemplo: make build env=prd"; \
		exit 1; \
	fi
	@echo "📦 Compilando APK para o ambiente: $(env)..."
	fvm flutter build apk --release --flavor $(env) --target lib/main_$(env).dart
	@echo "✅ Build para $(env) concluído!"

.PHONY: bundle
bundle:
	@echo "📦 Compilando App Bundle (AAB) para o ambiente de produção (prd)..."
	@fvm flutter build appbundle --release --flavor prd --target lib/main.dart
	@echo "✅ App Bundle para prd concluído!"

.PHONY: icons
icons:
	@dart run scripts/generate_icons.dart
	@dart run scripts/update_ios_icons.dart

.PHONY: help
help:
	@echo "--------------------------------------------------"
	@echo "  Comandos disponíveis para o projeto:"
	@echo "--------------------------------------------------"
	@echo "  make clean                Limpa o projeto e busca as dependências."
	@echo "  make assets               Gera o arquivo 'assets.dart' com base na pasta de assets."
	@echo "  make l10n                 Gera os arquivos de internacionalização (l10n) com base nos arquivos .arb."
	@echo "  make module n=<nome>      Cria a estrutura completa de um novo módulo."
	@echo "                            Exemplo: make module n=auth_login"
	@echo "  make watch                Inicia o build_runner em modo 'watch' para gerar arquivos."
	@echo "  make build [env=<env>]    Compila o APK para um ambiente (dev, hom, prd)."
	@echo "                            Padrão: dev. Exemplo: make build env=prd"
	@echo "  make bundle               Compila o App Bundle (AAB) para o ambiente de produção (prd)."
	@echo "  make icons                Gera todos os ícones para todos os flavors e configura o iOS."
	@echo "--------------------------------------------------"