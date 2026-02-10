# Projeto Flutter Multi-Tenant (White Label)

Este projeto é uma aplicação Flutter desenvolvida com uma arquitetura **Multi-Tenant (White Label)**, permitindo a geração de múltiplas versões do aplicativo (flavors) para diferentes clientes a partir de uma única base de código.

## 🚀 Objetivo

O principal objetivo deste projeto é fornecer uma estrutura escalável onde novos clientes ("tenants") podem ser adicionados rapidamente com suas próprias configurações visuais (ícones, cores, assets) e de infraestrutura (Firebase, API).

## 🏗️ Arquitetura e Estrutura

### 📁 Módulos
O projeto utiliza um padrão de modularização onde cada funcionalidade principal reside em `lib/modules`. Cada módulo segue uma estrutura organizada:
- `controllers/`: Lógica de apresentação (utilizando `signals`).
- `repositories/`: Camada de dados e integração com APIs.
- `models/`: Definições de dados (DTOs e entidades).
- `widgets/`: Componentes exclusivos do módulo.
- `mixins/`: Variáveis e estados compartilhados.

### 🍱 Multi-Tenant (Flavors)
A configuração de cada tenant é gerenciada através de flavors, organizados da seguinte forma:

#### Assets por Tenant
Localizados em `assets/flavors/{tenant}/{ambiente}/`:
- `launch_icon.png`: Ícone de inicialização.
- `background.png`: Fundo para ícones adaptativos no Android.
- Outros assets específicos.

#### Configurações de Build
- **Android**: Utiliza flavors definidos no `build.gradle`.
- **iOS**: Utiliza **Build Configurations** e **Schemes** personalizados. As configurações de Firebase (`GoogleService-Info.plist`) para cada tenant ficam em `ios/config/{tenant}/`.

## ⚙️ Automação (Scripts)

O projeto conta com scripts Dart para automatizar tarefas complexas de configuração:

### 🎨 Geração de Ícones (`scripts/generate_icons.dart`)
Este script automatiza o uso do `flutter_launcher_icons` para todos os tenants detectados:
1. Varre `assets/flavors/` para identificar tenants e ambientes.
2. Gera arquivos temporários de configuração `.yaml` para cada flavor.
3. Executa a geração de ícones.
4. **Limpa os arquivos temporários** após a execução para manter a raiz do projeto organizada.

### 🍎 Configuração iOS (`scripts/update_ios_icons.dart`)
Como o iOS utiliza `Asset Catalogs` específicos para ícones de cada flavor, este script:
1. Identifica os flavors do projeto.
2. Atualiza o arquivo `project.pbxproj` para apontar o `ASSETCATALOG_COMPILER_APPICON_NAME` correto para cada esquema de build (ex: `AppIcon-tenantDev`).

## 🛠️ Como Executar

O projeto utiliza um `Makefile` para facilitar os comandos do dia a dia.

### Comandos Principais

| Comando | Descrição |
| :--- | :--- |
| `make clean` | Limpa o projeto e baixa as dependências. |
| `make icons` | Gera todos os ícones para todos os flavors e configura o iOS. |
| `make assets` | Gera o arquivo `assets.dart` com referências tipadas para os assets. |
| `make module n=nome` | Cria a estrutura básica de um novo módulo. |
| `make build env=prd` | Compila o APK de produção para o ambiente informado. |

## 📝 Desenvolvimento

Ao adicionar um novo tenant:
1. Crie a pasta em `assets/flavors/{novo_tenant}/`.
2. Adicione os assets necessários (`launch_icon.png`, etc).
3. Adicione as configurações de Firebase em `ios/config/{novo_tenant}/`.
4. Execute `make icons` para configurar os recursos visuais.

---
Desenvolvido com ❤️ pelo time de engenharia.
