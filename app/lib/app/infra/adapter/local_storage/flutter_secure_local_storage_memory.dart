import 'package:app/app/domain/entities/dk_keys.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';

class FlutterSecureLocalStorageMemory implements LocalStorage {
  final Map<String, dynamic> _db = {};

  @override
  Future<void> write(String key, String data) async {
    _db[key] = data;
  }

  @override 
  Future<String?> read(String key) async {
    return _db[key];
  }

  @override
  Future<void> delete(String key) async {
    _db.remove(key);
  }

}
