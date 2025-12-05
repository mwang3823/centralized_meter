import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/shared_prefs/shared_prefs.dart';
import '../data/local/shared_prefs/shared_prefs_key.dart';
import 'constant.dart';
import 'globals.dart';

class Config {
  static Future<void> getPreferences({
    String environment = 'DEV',
    String? digitizeKey,
    bool displayPrint = false,
    bool enableLang = true,
    String langDefault = "vi",
    String? mapApiKey,
    String? releaseDate,
    String? server,
    String? nhaBeSever
  }) async {
    await SharedPreferences.getInstance().then((event) async {
      Globals.prefs = SharedPrefs(event);

      Globals.applicationMode = environment;
      Globals.config = Config(
        digitizeKey: digitizeKey,
        displayPrint: displayPrint,
        enableLang: enableLang,
        langDefault: langDefault,
        mapApiKey: mapApiKey,
        releaseDate: releaseDate,
        server: server,
        nhaBeSever: nhaBeSever
      );
      if ((Globals.config.langDefault ?? "").isNotEmpty) {
        Constant.langDefault = Globals.config.langDefault!;
      }
      String lang = Globals.prefs.getString(
        SharedPrefsKey.language,
        value: Constant.langDefault,
      );
      Globals.locale = Locale(lang);
    });
    return;
  }

  String? nhaBeSever;
  String? server;
  String? langDefault;
  bool? enableLang;
  String? releaseDate;
  bool? displayPrint;
  String? mapApiKey;
  String? digitizeKey;

  Config({
    this.server,
    this.langDefault,
    this.enableLang,
    this.releaseDate,
    this.displayPrint,
    this.mapApiKey,
    this.digitizeKey,
    this.nhaBeSever
  });

  Config.fromJson(Map<String, dynamic> json) {
    server = json['server'];
    if (!server!.endsWith("/")) {
      server = "$server/";
    }
    langDefault = json['langDefault'];
    enableLang = json['enableLang'] ?? false;
    releaseDate = json['releaseDate'];
    displayPrint = json['displayPrint'] ?? false;
    mapApiKey = json['mapApiKey'];
    digitizeKey = json['digitizeKey'];
    nhaBeSever = json['nhaBeSever'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['server'] = this.server;
    data['langDefault'] = this.langDefault;
    data['enableLang'] = this.enableLang;
    data['releaseDate'] = this.releaseDate;
    data['displayPrint'] = this.displayPrint;
    data['mapApiKey'] = this.mapApiKey;
    data['digitizeKey'] = this.digitizeKey;
    data['nhaBeSever'] = this.nhaBeSever;
    return data;
  }
}
