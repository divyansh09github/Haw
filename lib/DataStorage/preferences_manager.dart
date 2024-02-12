import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager{

  static Future<void> setInitialScreen(String value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('initialScreen', value);
  }

  static Future<String?> getInitialScreen() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('initialScreen');
  }

  static Future<bool> getHaveAnAccount() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('haveAnAccount') ?? false;
  }


  static Future<void> setHaveAnAccount(bool value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('haveAnAccount', value);
  }

  static Future<DateTime?> getLastPeriodDate() async {
    final prefs = await SharedPreferences.getInstance();
    final lastPeriodDateString = prefs.getString('last_period_date');
    // Parse the string into a DateTime, handling potential null values
    return lastPeriodDateString == null ? null : DateTime.parse(lastPeriodDateString);
  }

  static Future<void> setLastPeriodDate(DateTime lastPeriodDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_period_date', lastPeriodDate.toIso8601String());
  }

  static Future<int> getCycleLength() async{
    final prefs = await SharedPreferences.getInstance();
    // final cycleLength = prefs.getInt('cycleLength');

    return prefs.getInt('cycleLength') ?? 0;
  }

  static Future<void> setCycleLength(int cycleLength) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cycleLength', cycleLength);
  }

  static Future<int> getPeriodDuration() async{
    final prefs = await SharedPreferences.getInstance();
    // final periodDurationLength = prefs.getInt('periodDuration');

    return prefs.getInt('periodDuration') ?? 0;
  }

  static Future<void> setPeriodDuration(int periodDuration) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('periodDuration', periodDuration);
  }

  static Future<DateTime?> getPredictedDate() async{
    final prefs = await SharedPreferences.getInstance();
    final predictedDate = prefs.getString('predicted_date');
    // Parse the string into a DateTime, handling potential null values
    return predictedDate == null ? null : DateTime.parse(predictedDate);
  }

  static Future<void> setPredictedDate(DateTime predictedDate) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('predicted_date', predictedDate.toIso8601String());
  }

  //User Id and Token

  static Future<void> setUserId(int value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', value);
  }

  static Future<int?> getUserId() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  static Future<void> setUserToken(String value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', value);
  }

  static Future<String?> getUserToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }
  //Username
  static Future<String> getUserName() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? "";
  }

  static Future<void> setUserName(String name) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  // Signup Screen

  static Future<void> setSignUpVariables({
    required String name,
    required String dob,
    required String age,
    required String maritalStatus,
    required String region,
    required String height,
    required String weight,
  }) async {
    final Map<String, dynamic> variablesMap = {
      'name': name,
      'dob': dob,
      'age': age,
      'maritalStatus': maritalStatus,
      'region': region,
      'height': height,
      'weight': weight,
    };
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', jsonEncode(variablesMap));
    await prefs.setString('dob', jsonEncode(variablesMap));
    await prefs.setString('age', jsonEncode(variablesMap));
    await prefs.setString('maritalStatus', jsonEncode(variablesMap));
    await prefs.setString('region', jsonEncode(variablesMap));
    await prefs.setString('height', jsonEncode(variablesMap));
    await prefs.setString('weight', jsonEncode(variablesMap));

  }
  static Future<Map<String, dynamic>?> getSignUpVariables() async{
    final prefs = await SharedPreferences.getInstance();
    final String? encodedVariables = prefs.getString('name');
    if (encodedVariables != null) {
      return jsonDecode(encodedVariables) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  //Profile screen

  static Future<void> setProfileVariables({
    required String name,
    required String dob,
    required String maritalStatus,
    required String region,
    required String height,
    required String weight,
    required String phone,
  }) async {
    final Map<String, dynamic> variablesMap = {
      'name': name,
      'dob': dob,
      'maritalStatus': maritalStatus,
      'region': region,
      'height': height,
      'weight': weight,
      'phone' : phone,
    };
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', jsonEncode(variablesMap));
    await prefs.setString('dob', jsonEncode(variablesMap));
    await prefs.setString('maritalStatus', jsonEncode(variablesMap));
    await prefs.setString('region', jsonEncode(variablesMap));
    await prefs.setString('height', jsonEncode(variablesMap));
    await prefs.setString('weight', jsonEncode(variablesMap));
    await prefs.setString('phone', jsonEncode(variablesMap));

  }
  static Future<Map<String, dynamic>?> getProfileVariables() async{
    final prefs = await SharedPreferences.getInstance();
    final String? encodedVariables = prefs.getString('name');
    if (encodedVariables != null) {
      return jsonDecode(encodedVariables) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  //Symptoms Screen Preference Manager

  static const _flow = 'intKey1';
  static const _feelings = 'intKey2';
  static const _liveliness = 'intListKey1';
  static const _energy = 'intListKey2';
  static const _dateKey = 'dateKey';

  static Future<void> setSymptoms({
    required int flow,
    required List<int> feelings,
    required List<int> liveliness,
    required int energy,
    required DateTime date,

  }) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_flow, flow);
    await prefs.setStringList(_feelings, feelings.map((e) => e.toString()).toList());
    await prefs.setStringList(_liveliness, liveliness.map((e) => e.toString()).toList());
    await prefs.setInt(_energy, energy);
    await prefs.setString(_dateKey, date.toIso8601String());
  }

  static Future<Map<String, dynamic>> getSymptoms() async {
    final prefs = await SharedPreferences.getInstance();

    final dateString = prefs.getString(_dateKey);

    return {
      'flow': prefs.getInt(_flow) ?? -1,
      'feelings': prefs.getStringList(_feelings)?.map(int.parse)?.toList() ?? [],
      'liveliness': prefs.getStringList(_liveliness)?.map(int.parse)?.toList() ?? [],
      'energy': prefs.getInt(_energy) ?? 1,
      'date': dateString == null ? null : DateTime.parse(dateString),
    };
  }

  //PinCode AppLock

  static Future<String> getPinCode() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('pinCode') ?? "0";
  }

  static Future<void> setPinCode(String pinCode) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pinCode', pinCode);
  }

  static Future<bool> getIsPinSet() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isPinSet') ?? false;
  }

  static Future<void> setIsPinSet(bool value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPinSet', value);
  }

  static Future<bool> getIsLockEnabled() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLockEnabled') ?? false;
  }

  static Future<void> setIsLockEnabled(bool value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLockEnabled', value);
  }

}