import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PostAPIService{



  Future saveCycleLength(int length) async {
    // var length = await PreferencesManager.getCycleLength();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();
    print(length);

    final response = await http.post(
        Uri.parse('$apiUrl/api/save-cycle-length?'
            'id=$userId'
            '&token=$token'
            '&average_cycle_length=$length'),
        headers: {"Content-Type": "application/json"}
        );

        print(response.body);
  }

  Future savePeriodDay(DateTime date) async{
    // DateTime? periodDate = await PreferencesManager.getLastPeriodDate();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    print(formattedDate);

    final response = await http.post(
        Uri.parse('$apiUrl/api/save-period-day?'
            'id=$userId'
            '&token=$token'
            '&period_day=$formattedDate'),
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future savePeriodDuration(int durationLength) async{
    // var durationLength = await PreferencesManager.getPeriodDuration();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();
    print(durationLength);

    final response = await http.post(
        Uri.parse('$apiUrl/api/save-cycle-days?'
            'id=$userId'
            '&token=$token'
            '&average_cycle_days=$durationLength'),
        // qParams: queryParameters,
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future saveSignUpQuestions() async{
    var signUpVariables = await PreferencesManager.getSignUpVariables();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();
    // print(signUpVariables?['name']);
    // print(signUpVariables?['dob']);
    // print(signUpVariables?['maritalStatus']);
    // print(signUpVariables);


    final response = await http.post(Uri.parse(
        '$apiUrl/api/save-deatils?'
        'id=$userId'
        '&token=$token'
        '&name=${signUpVariables?['name']}'
        '&dob=${signUpVariables?['dob']}'
        '&age=${signUpVariables?['age']}'
        '&marital_status=${signUpVariables?['maritalStatus']}'
        '&height=${signUpVariables?['height']}'
        '&weight=${signUpVariables?['weight']}'
        '&country_id=2'
    ),
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future saveProfileEdit() async{
    var profileVariables = await PreferencesManager.getProfileVariables();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();



    final response = await http.post(Uri.parse(
    "http://ehoaapp.techexposys.com/api/update-users?"
    "id=$userId"
    "&token=$token"
    "&name=${profileVariables?['name']}"
    "&dob=${profileVariables?['dob']}"
    "&state_name=${profileVariables?['region']}"
    "&weight=${profileVariables?['weight']}"
    "&height=${profileVariables?['height']}"
    "&phone_number=${profileVariables?['phone']}"
    "&marital_status=${profileVariables?['maritalStatus']}"
    ),
        headers: {"Content-Type": "application/json"}
    );
    print(response.body);
  }

  Future saveProfileImage(File? imageFile) async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    print(token);
    print(userId);

    final data = jsonEncode({'id': userId, 'password': token, 'image': imageFile?.path,});

    final response = await http.post(Uri.parse(
        "http://ehoaapp.techexposys.com/api/save-profile-image"),
        body: data,
        headers: {"Content-Type": "application/json"}
    );
    print('image storage : ${response.body}');

  }

  Future saveTrackSymptoms(List<int> feelings, List<int> liveliness, int flow, int energy, DateTime date) async{
    // Getting all values:
    // final data = await PreferencesManager.getSymptoms();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    print(liveliness);
    print(energy.runtimeType);
    // String liveliness = data['liveliness'].map((number) => number.toString()).join(',');
    // String feelings = data['feelings'].map((number) => number.toString()).join(',');
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    final response = await http.post(Uri.parse(
        '$apiUrl/api/save-symptoms?'
            'id=$userId'
            '&token=$token'
            '&menstrual_flow=${flow <= 0 ? null : flow}'
            '&symptoms[]=$liveliness'
            '&energy=${energy <= 0 ? null : energy}'
            '&emotions[]=$feelings'
            '&date=$formattedDate'
    ),
        headers: {"Content-Type": "application/json"}
    );

    print(response.body);

    // print((data['date']).runtimeType);
    // print(data['flow']);
    // print(data['feelings']);
    // print(data['energy']);
    // print(data['liveliness']);

  }

  Future<http.Response> registerUser(String email, String password) async{

    final data = jsonEncode({'email': email, 'password': password});

    final response = await http.post(
        Uri.parse('http://ehoaapp.techexposys.com/api/create-user'),
        body: data,
        headers: {"Content-Type": "application/json"});

    // if(response.statusCode == 200)
    //   {
    //     return response;
    //   }
    // else {
    //   return response;
    // }
    return response;
  }

}