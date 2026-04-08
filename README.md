# Projeto Flutter Multi-Tenant (White Label)

Este projeto é uma aplicação Flutter desenvolvida com uma arquitetura **Multi-Tenant (White Label)** de alto desempenho, permitindo a geração de múltiplas versões do aplicativo (flavors) para diferentes clientes a partir de uma única base de código, com identidades visuais e ambientes (Dev/Hom/Prod) totalmente isolados.

---

## 📋 Índice

1. [Conceitos Fundamentais](#1-conceitos-fundamentais)
2. [Estratégia de Identificação e Ambientes](#2-estratégia-de-identificação-e-ambientes)
3. [Configuração da Camada Nativa: Android](#3-configuração-da-camada-nativa-android)
4. [Configuração da Camada Nativa: iOS (Matriz Completa)](#4-configuração-da-camada-nativa-ios)
5. [Implementação na Camada Flutter](#5-implementação-na-camada-flutter)
6. [Gestão de Assets e Ícones (Automação)](#6-gestão-de-assets-e-ícones-automação)
7. [Guia: Adicionando um Novo Tenant](#7-guia-adicionando-um-novo-tenant)
8. [Ambiente de Desenvolvimento](#8-ambiente-de-desenvolvimento)

---

## 1. Conceitos Fundamentais

* **White Label:** Arquitetura onde o mesmo produto é licenciado para diferentes empresas, utilizando a mesma base de código.
* **Tenant (Cliente):** A entidade contratante (ex: `Empresa A`, `Empresa C`).
* **Flavor/Scheme:** Variantes de compilação que definem qual cliente e ambiente estão sendo construídos.
* **Build Configuration:** No iOS, define *como* o código é compilado (Debug/Release/Profile).

## 2. Estratégia de Identificação e Ambientes

Adotamos a estratégia **Side-by-Side**. Utilizamos sufixos nos identificadores para permitir que as versões de Desenvolvimento, Homologação e Produção sejam instaladas simultaneamente no mesmo dispositivo.

| **Ambiente** | **Sufixo** | **Exemplo de Bundle ID** | **Instalação** |
| :--- | :--- | :--- | :--- |
| **Desenvolvimento** | `.dev` | `br.com.cliente.app.dev` | App de Teste Interno |
| **Homologação** | `.hom` | `br.com.cliente.app.hom` | App de QA/UAT |
| **Produção** | (sem sufixo) | `br.com.cliente.app` | App Oficial da Loja |

---

## 3. Configuração da Camada Nativa: Android

No Android, o Gradle gerencia a complexidade através de `flavorDimensions`: `customer` e `environment`.

### 3.1. Gradle (`build.gradle.kts`)

Configuramos dimensões cruzadas para permitir combinações como `empresaADev`, `empresaCHom`, etc. O `applicationIdSuffix` garante a coexistência dos apps.

### 3.2. Integração Firebase (Arquivo Único)

Utilizamos um único arquivo `google-services.json` em `android/app/`. Este arquivo contém as credenciais de **todos** os apps registrados (todos os ambientes de todos os clientes).

> [!IMPORTANT]
> Se você esquecer de cadastrar a versão `.dev` no Firebase, o build falhará ao tentar localizar as credenciais para o ambiente de desenvolvimento.

---

## 4. Configuração da Camada Nativa: iOS

No iOS, utilizamos uma **Matriz Completa de Configurações**. Para cada cliente, existem 9 Build Configurations (3 Ambientes x 3 Modos de Compilação).

### 4.1. Scripts de Automação (Build Phases)

Injetamos scripts Shell na fase de compilação para resolver limitações nativas do Xcode:

* **Setup White Label:** Executa os scripts de configuração antes da compilação.
* **copy_firebase_config.sh:** Copia o `GoogleService-Info.plist` correto da pasta `ios/config/{tenant}/`.
* **set_app_name.sh:** Altera o nome de exibição do app dinamicamente (ex: "App Name (Dev)").

---

## 5. Implementação na Camada Flutter

No Dart, as configurações são injetadas via `--dart-define` na linha de comando e capturadas no `bootstrap`:

```dart
Future<void> bootstrap() async {
  const customerKey = String.fromEnvironment('CUSTOMER', defaultValue: 'empresaA');
  const envKey = String.fromEnvironment('ENV', defaultValue: 'dev');

  CustomerConfig.init(customerKey);
  FlavorConfig.init(envKey);

  runApp(AppWidget());
}
```

---

## 6. Gestão de Assets e Ícones (Automação)

Utilizamos o comando `make icons` que orquestra uma automação em duas etapas:

1. **Etapa 1 (Geração):** Varre `assets/flavors/` e gera ícones Android/iOS via `flutter_launcher_icons`.
2. **Etapa 2 (Vinculação iOS):** Faz o parse do `project.pbxproj` e vincula o `ASSETCATALOG_COMPILER_APPICON_NAME` correto para cada Build Configuration automaticamente.

---

## 7. Guia: Adicionando um Novo Tenant

Siga este roteiro para adicionar a **"Empresa C"**:

### Passo 1: Assets e Automação

1. Adicione `empresac` ao `enum Customer` no código Dart.
2. Crie a estrutura `assets/flavors/empresac/{dev,hom,prod}` com os ícones.
3. Execute `make icons` imediatamente.

### Passo 2: Android

1. Adicione o flavor `empresac` no `build.gradle.kts`.
2. Registre os 3 apps no Firebase e atualize o `google-services.json`.

### Passo 3: iOS (Xcode)

1. Crie a pasta `ios/config/empresac/` e adicione o `GoogleService-Info.plist`.
2. Crie as **9 Build Configurations** no Xcode seguindo a nomenclatura `Mode-tenantEnv`.
3. Configure `PRODUCT_BUNDLE_IDENTIFIER` e assinaturas (Signing).
4. Crie os 3 Schemes (`empresaCDev`, `empresaCHom`, `empresaCProd`).

---

## 8. Ambiente de Desenvolvimento

Exemplo de `.vscode/launch.json` para facilitar o switch entre clientes:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Empresa C (Dev)",
            "request": "launch",
            "type": "dart",
            "args": [
                "--flavor", "empresaCDev",
                "--target", "lib/main.dart",
                "--dart-define=CUSTOMER=empresac",
                "--dart-define=ENV=dev"
            ]
        }
    ]
}
```

---
Desenvolvido com ❤️ pelo time de engenharia.
