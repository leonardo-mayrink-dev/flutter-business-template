import 'package:shared_preferences/shared_preferences.dart';

/// Singleton responsável por manter a SharedPreferences, que é um conjunto
/// de chaves-valor armazenados no aplicativo.
class SharedPreferencesService {
  static final SharedPreferencesService _singleton =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() {
    return _singleton;
  }
  SharedPreferencesService._internal();

  /// Instância de SharedPreferences
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Retorna um [int] do SharedPreferences dado a [chave].
  /// Caso não encontre, retorna [null].
  static Future<int?> getInt(String chave) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getInt(chave);
  }

  /// Armazena um [valor] int no SharedPreferences atrelado a uma [chave].
  /// Retorna [true] indicando sucesso e [false] para insucesso.
  static Future<bool> setInt(String chave, int valor) async {
    if (chave.isEmpty) return false;
    SharedPreferences prefs = await _prefs;
    return await prefs.setInt(chave, valor).then((bool result) {
      return result;
    });
  }

  /// Retorna uma [String] do SharedPreferences dado a [chave].
  /// Caso não encontre, retorna [null].
  static Future<String?> getString(String chave) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(chave);
  }

  /// Armazena um [valor] String no SharedPreferences atrelado a uma [chave].
  /// Retorna [true] indicando sucesso e [false] para insucesso.
  static Future<bool> setString(String chave, String valor) async {
    if (chave.isEmpty) return false;
    SharedPreferences prefs = await _prefs;
    return await prefs.setString(chave, valor).then((bool result) {
      return result;
    });
  }

  /// Retorna um [double] do SharedPreferences dado a [chave].
  /// Caso não encontre, retorna [null].
  static Future<double?> getDouble(String chave) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getDouble(chave);
  }

  /// Armazena um [valor] double no SharedPreferences atrelado a uma [chave].
  /// Retorna [true] indicando sucesso e [false] para insucesso.
  static Future<bool> setDouble(String chave, double valor) async {
    if (chave.isEmpty) return false;
    SharedPreferences prefs = await _prefs;
    return await prefs.setDouble(chave, valor).then((bool result) {
      return result;
    });
  }

  /// Retorna um [bool] do SharedPreferences dado a [chave].
  /// Caso não encontre, retorna [null].
  static Future<bool?> getBool(String chave) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool(chave);
  }

  /// Armazena um [valor] bool no SharedPreferences atrelado a uma [chave].
  /// Retorna [true] indicando sucesso e [false] para insucesso.
  static Future<bool> setBool(String chave, bool valor) async {
    if (chave.isEmpty) return false;
    SharedPreferences prefs = await _prefs;
    return await prefs.setBool(chave, valor).then((bool result) {
      return result;
    });
  }

  /// Remove uma [chave] do SharedPreferences.
  static Future<bool> removeKey(String chave) async {
    SharedPreferences prefs = await _prefs;
    return await prefs.remove(chave);
  }

  /// Limpa todos os dados armazenados no SharedPreferences.
  static Future<bool> clear() async {
    SharedPreferences prefs = await _prefs;
    return await prefs.clear();
  }
}
