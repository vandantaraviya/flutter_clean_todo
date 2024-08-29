import 'dart:developer';
import 'package:flutter_clean_todo/core/constants/storage_key.dart';
import 'package:flutter_clean_todo/core/services/storage_services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends GetxService {
  final StorageService storageService;

  TranslationService({required this.storageService});

  final RxString _langCode = "en_US".obs;

  RxString get langCode => _langCode;

  @override
  void onInit() async {
    await initLocaleServices();
    Get.updateLocale(Locale(_langCode.value));
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await initLocaleServices();
    Get.updateLocale(Locale(_langCode.value));
    super.onReady();
  }

  /// Initializes locale services by checking stored locale or setting default.
  Future<void> initLocaleServices() async {
    log("initLocaleServices called", name: "initLocaleServices");

    try {
      bool isLocaleContains = storageService.containsKey(StorageKey.langCode);
      if (isLocaleContains) {
        String storageCode = await getLocaleFromStorage();
        await setLocale(storageCode);
      } else {
        await setLocale("en_US");
      }
    } catch (e) {
      log("Error initializing locale services: $e", name: "initLocaleServices");
      await setLocale("en_US");
    }
  }

  /// Changes the locale and updates the storage.
  Future<void> changeLocale({required String languageCode}) async {
    await setLocale(languageCode);
  }

  /// Sets the locale both in memory and in storage.
  Future<void> setLocale(String code) async {
    _langCode.value = code;
    storageService.setString(key: StorageKey.langCode, value: code);
    Get.updateLocale(Locale(code));
  }

  /// Retrieves the locale from storage.
  Future<String> getLocaleFromStorage() async {
    String? storageCode = storageService.getString(StorageKey.langCode);
    if (storageCode == null) {
      return "en_US";
    } else {
      return storageCode;
    }
  }
}
