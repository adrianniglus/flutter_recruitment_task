import 'package:envied/envied.dart';

import 'environment_handler.dart';

part 'key_handler.g.dart';

@Envied(path: '.env')
final class KeyHandler {
  @EnviedField(varName: 'TMDB_STAGING_KEY', obfuscate: true)
  static final String _tmdbStagingApiKey = _KeyHandler._tmdbStagingApiKey;
  @EnviedField(varName: 'TMDB_PROD_KEY', obfuscate: true)
  static final String _tmdbProdApiKey = _KeyHandler._tmdbProdApiKey;

  String get getApiKeyByFlavor {
    switch (EnvironmentHandler.current) {
      case EnvironmentType.prod:
        return _tmdbProdApiKey;
      default:
        return _tmdbStagingApiKey;
    }
  }
}
