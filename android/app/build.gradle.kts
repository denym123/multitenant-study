plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.empresaA.projeto"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.empresaA.projeto"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += listOf("customer", "environment")
    productFlavors {
        // --- Dimensão: CUSTOMER ---
        create("empresaA") {
            dimension = "customer"
            applicationId = "br.com.empresaA.projeto"
            manifestPlaceholders["appName"] = "Empresa A"
        }
        create("empresaB") { // Novo Cliente
            dimension = "customer"
            applicationId = "br.com.empresaB.projeto"
            manifestPlaceholders["appName"] = "Empresa B"
        }
        // --- Dimensão: ENVIRONMENT ---
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["envSuffix"] = " (Dev)"
        }
        create("hom") {
            dimension = "environment"
            applicationIdSuffix = ".hom"
            manifestPlaceholders["envSuffix"] = " (Hom)"
        }
        create("prod") {
            dimension = "environment"
            manifestPlaceholders["envSuffix"] = ""
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
