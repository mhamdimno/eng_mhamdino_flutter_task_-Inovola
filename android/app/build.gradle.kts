plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
import java.io.FileInputStream
import java.util.Properties

// Load properties from key.properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.example.eng_mhamdino_flutter_task"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13113456"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.eng_mhamdino_flutter_task"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
   
 
    }
      signingConfigs {
        create("release") { // Use 'create("name")' for new signing configs
                // Check if properties exist before using them to prevent errors
                // during debug builds or if key.properties is missing
                if (keystoreProperties.containsKey("storeFile")) {
                    storeFile = file(keystoreProperties["storeFile"] as String)
                }
                if (keystoreProperties.containsKey("storePassword")) {
                    storePassword = keystoreProperties["storePassword"] as String
                }
                if (keystoreProperties.containsKey("keyAlias")) {
                    keyAlias = keystoreProperties["keyAlias"] as String
                }
                if (keystoreProperties.containsKey("keyPassword")) {
                    keyPassword = keystoreProperties["keyPassword"] as String
                }
            }
    }
  
   buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release") // Use getByName

            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                file("proguard-rules.pro")
            )
        }
    }

}
flutter {
    source = "../.."
}
