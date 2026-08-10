// хранит access token ТОЛЬКО в памяти для веба
// refresh token сюда не попадает вообще
class WebTokenHolder {
  String? _accessToken;

  void saveAccessToken(String token) => _accessToken = token;

  String? getAccessToken() => _accessToken;
  
  void clear() => _accessToken = null;
}