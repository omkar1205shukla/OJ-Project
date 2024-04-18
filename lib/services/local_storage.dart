import 'dart:convert';

import 'package:medhub/models/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? sharedPreferences;
  static final LocalStorage _instance = LocalStorage._();

  LocalStorage._();

  static LocalStorage get instance => _instance;

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool isUserLoggedIn() {
    bool userLoggedIn =
        sharedPreferences!.getBool(LocalStoragekeys.userLoggedIn) ?? false;
    return userLoggedIn;
  }

  void setUserLoggedIn() {
    sharedPreferences!.setBool(LocalStoragekeys.userLoggedIn, true);
  }

  void logOut() {
    sharedPreferences?.clear();
  }

  UserProfile getUserProfile() {
    final storedData =
        sharedPreferences!.getString(LocalStoragekeys.userProfile);
    UserProfile storedPerson =
        UserProfile.fromJson(json.decode(storedData!) as Map<String, dynamic>);
    return storedPerson;
  }

  Future<void> saveUserProfile(UserProfile person) async {
    final personJson = person.toJson();
    await sharedPreferences!
        .setString(LocalStoragekeys.userProfile, json.encode(personJson));
  }
}

class LocalStoragekeys {
  static const userLoggedIn = 'is_user_logged_in';
  static const userProfile = 'user_profile';
}
