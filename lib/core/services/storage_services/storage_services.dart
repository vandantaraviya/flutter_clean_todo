import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _sharedPreferences;

  // Private constructor
  StorageService._internal();

  // Factory constructor to return the same instance
  factory StorageService() {
    return StorageService._internal();
  }

  // Initialization method
  static Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return StorageService();
  }

  Future<bool> setString({required String key, required String value}) async {
    try {
      return await _sharedPreferences.setString(key, value);
    } catch (e) {
      // Log the error or handle it as needed
      log('Error setting string: $e');
      return false;
    }
  }

  Future<bool> setBool({required String key, required bool value}) async {
    try {
      return await _sharedPreferences.setBool(key, value);
    } catch (e) {
      // Log the error or handle it as needed
      log('Error setting bool: $e');
      return false;
    }
  }

  String? getString(String key) {
    try {
      return _sharedPreferences.getString(key);
    } catch (e) {
      // Log the error or handle it as needed
      log('Error getting string: $e');
      return null;
    }
  }

  bool? getBool(String key) {
    try {
      return _sharedPreferences.getBool(key);
    } catch (e) {
      // Log the error or handle it as needed
      log('Error getting bool: $e');
      return null;
    }
  }

  bool containsKey(String key) {
    try {
      return _sharedPreferences.containsKey(key);
    } catch (e) {
      // Log the error or handle it as needed
      log('Error checking key: $e');
      return false;
    }
  }

  Future<void> removeFromStorageKeys({required List<String> listKey}) async {
    try {
      for (var element in listKey) {
        await _sharedPreferences.remove(element);
      }
    } catch (e) {
      // Log the error or handle it as needed
      log('Error removing keys: $e');
    }
  }

  Future<bool> clearStorage() async {
    try {
      return await _sharedPreferences.clear();
    } catch (e) {
      // Log the error or handle it as needed
      log('Error clearing storage: $e');
      return false;
    }
  }
}
