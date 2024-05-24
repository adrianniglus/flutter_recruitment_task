import 'package:envied/envied.dart';
import 'package:injectable/injectable.dart';

import 'environment_handler.dart';

part 'key_handler.g.dart';

// This class is used to store the API keys
@singleton
@Envied(path: '.env')
class KeyHandler {
  @EnviedField(varName: 'TMDB_STAGING_KEY', obfuscate: true)
  static final String _tmdbStagingApiKey = _KeyHandler._tmdbStagingApiKey;
  @EnviedField(varName: 'TMDB_PROD_KEY', obfuscate: true)
  static final String _tmdbProdApiKey = _KeyHandler._tmdbProdApiKey;

  // This method is used to get the API key based on the current environment
  String get getApiKeyByFlavor {
    switch (EnvironmentHandler.current) {
      case EnvironmentType.prod:
        return _tmdbProdApiKey;
      default:
        return _tmdbStagingApiKey;
    }
  }
}
