import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/user_model.dart';


class UserLocalDatasource {
  Box get _box => Hive.box(HiveService.userBoxName);

  static const _meKey = 'me';
  static String _profileKey(String userId) => 'profile_$userId';

  // кэш собственного профиля — для мгновенного открытия экрана и фоллбэка
  Future<void> cacheMe(User user) async {
    await _box.put(_meKey, jsonEncode(user.toJson()));
  }

  User? getCachedMe() {
    final raw = _box.get(_meKey) as String?;
    if (raw == null) return null;
    return User.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  // кэш чужих профилей
  Future<void> cacheUserProfile(String userId, PartialUser user) async {
    await _box.put(_profileKey(userId), jsonEncode(user.toJson()));
  }

  PartialUser? getCachedUserProfile(String userId) {
    final raw = _box.get(_profileKey(userId)) as String?;
    if (raw == null) return null;
    return PartialUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }
}