import 'package:hive_flutter/adapters.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class HiveStorage implements IPersistStore {
  late Box x;
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    x = await Hive.openBox('dermatoma');
  }

  @override
  Future<void> deleteAll() async => await x.clear();

  @override
  Future<void> delete(String key) async => await x.delete(key);

  @override
  Object? read(String key) => x.get(key);

  @override
  Future<void> write<T>(String key, T value) async => await x.put(key, value);
}
