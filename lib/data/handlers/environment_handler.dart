import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';

const iosDevPackageName = 'com.example.flutterRecruitmentTask.staging';
const iosProdPackageName = 'com.example.flutterRecruitmentTask';

const androidDevPackageName = 'com.example.flutter_recruitment_task.staging';
const androidProdPackageName = 'com.example.flutter_recruitment_task';

// Define the environment types
enum EnvironmentType {
  staging,
  prod,
}

// This class is responsible for handling the current environment
class EnvironmentHandler {
  EnvironmentHandler._();

  static late EnvironmentType _current;

  static EnvironmentType get current => _current;

  // Initialize the current environment based on the package name of the app
  static Future init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isIOS) {
      switch (packageInfo.packageName) {
        case iosProdPackageName:
          _current = EnvironmentType.prod;
          break;
        default:
          _current = EnvironmentType.staging;
      }
    }
    if (Platform.isAndroid) {
      switch (packageInfo.packageName) {
        case androidProdPackageName:
          _current = EnvironmentType.prod;
          break;
        default:
          _current = EnvironmentType.staging;
      }
    }
  }

 // Get the current package name based on the current environment
  static String get currentPackageName {
    if (Platform.isIOS) {
      switch (_current) {
        case EnvironmentType.prod:
          return iosProdPackageName;
        default:
          return iosDevPackageName;
      }
    }
    if (Platform.isAndroid) {
      switch (_current) {
        case EnvironmentType.prod:
          return androidProdPackageName;
        default:
          return androidDevPackageName;
      }
    }
    return androidDevPackageName;
  }
}
