abstract class LocalStorage {
  Future<void> write(String key, String data);
  Future<String?> read(String key);
  Future<void> delete(String key);
}