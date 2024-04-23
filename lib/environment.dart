import 'package:flutter_cicd/config/app_config.dart';
import 'package:flutter_cicd/config/app_config_dev.dart';
import 'package:flutter_cicd/config/app_config_prod.dart';
import 'package:flutter_cicd/config/app_config_staging.dart';

/// Enumeration type for each environment
enum EnvironmentType {
  dev("DEV"),
  staging("STAGING"),
  prod("PROD");

  final String name;
  const EnvironmentType(this.name);
}

class Environment {
  /// Implements singleton
  Environment._internal();
  static final Environment _singleton = Environment._internal();

  factory Environment() {
    return _singleton;
  }

  static late AppConfig config;

  Future<void> initConfig(String environment) async {
    config = _getConfig(environment);
  }

  AppConfig _getConfig(String environment) {
    Map<String, AppConfig> factories = <String, AppConfig>{};
    factories.putIfAbsent(EnvironmentType.dev.name, () => AppConfigDev());
    factories.putIfAbsent(
        EnvironmentType.staging.name, () => AppConfigStaging());
    factories.putIfAbsent(EnvironmentType.prod.name, () => AppConfigProd());

    AppConfig? config;
    if (factories.containsKey(environment)) {
      config = factories[environment];
    }

    return config ?? AppConfigDev();
  }
}
