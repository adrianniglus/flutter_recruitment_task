import 'package:envied/envied.dart';

part 'key_handler.g.dart';

@Envied(path: '.env')
final class KeyHandler {
  @EnviedField(varName: 'TMDB_KEY', obfuscate: true)
  static final String tmdbApiKey = _KeyHandler.tmdbApiKey;
}
