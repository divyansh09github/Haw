import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class PostAPIService{



  Future<http.Response> saveCycleLength(int length) async {
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
    return response;
  }

  Future<http.Response> savePeriodDay(DateTime date) async{
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

    return response;
  }

  Future<http.Response> savePeriodDuration(int durationLength) async{
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
    return response;
  }

  Future<http.Response> saveSignUpQuestions(String name, DateTime dob, String marital, String region, String height, String weight, String phone, String email) async{
    // var signUpVariables = await PreferencesManager.getSignUpVariables();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    String formattedDate = DateFormat('yyyy-MM-dd').format(dob);


    final response = await http.post(Uri.parse(
        'http://ehoaapp.techexposys.com/api/save-deatils?'
            'id=$userId'
            '&token=$token'
            '&name=$name'
            '&dob=$formattedDate'
            '&phone=$phone'
            '&marital_status=$marital'
            '&height=$height'
            '&weight=$weight'
            '&state_name=$region'
    ),
        headers: {"Content-Type": "application/json"}
    );
    print("abr : ${response.body}");

    return response;
  }

  Future<http.Response> saveProfileEdit() async{
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
    print(response.statusCode);

    return response;
  }

  Future<http.Response> saveProfileImage(File? imageFile) async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    print(token);
    print(userId);

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://ehoaapp.techexposys.com/api/update-profile-image"),
    );

    // Add user id and token as fields
    request.fields['id'] = userId.toString();
    request.fields['token'] = token!;

    // Add image file to the request
    var imageStream = http.ByteStream(imageFile!.openRead());
    var imageLength = await imageFile.length();
    var multipartFile = http.MultipartFile(
      'image',
      imageStream,
      imageLength,
      filename: imageFile.path.split('/').last,
    );
    request.files.add(multipartFile);

    // Send the request and await for response
    var response = await request.send();

    // Get the response from the server
    var responseData = await response.stream.transform(utf8.decoder).join();

    // Print the response
    print('image storage : ${response.statusCode}');
    print('img Response: $responseData');

    // Return the response
    return http.Response.fromStream(response);
  }

  Future<http.Response> saveTrackSymptoms(List<dynamic> feelings, List<dynamic> liveliness, dynamic flow, dynamic energy, DateTime date) async{
    // Getting all values:
    // final data = await PreferencesManager.getSymptoms();
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();



    print("flow: $flow ");
    print(flow.runtimeType);
    print("energy : $energy");
    print(energy.runtimeType);
    print("feelings: $feelings");
    print(feelings.runtimeType);
    print("liveliness : $liveliness");
    print(liveliness.runtimeType);
    // String liveliness = data['liveliness'].map((number) => number.toString()).join(',');
    // String feelings = data['feelings'].map((number) => number.toString()).join(',');
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    final data = jsonEncode({"symptoms": liveliness,"emotions": feelings,"date":formattedDate,"energy":energy,"menstrual_flow":flow,"id":userId,"token":token});
    final response = await http.post(Uri.parse(
        'http://ehoaapp.techexposys.com/api/save-symptoms'
    ),body: data,
        headers: {"Content-Type": "application/json"}
        // headers: {"Content-Type": "application/json","Authorization": "Bearer $token"}
    );

    print(response.body);

    // print((data['date']).runtimeType);
    // print(data['flow']);
    // print(data['feelings']);
    // print(data['energy']);
    // print(data['liveliness']);
    return response;

  }

  Future<http.Response> registerUser(String email, String password) async{

    final data = jsonEncode({'email': email, 'password': password});

    final response = await http.post(
        Uri.parse('http://ehoaapp.techexposys.com/api/create-user'),
        body: data,
        headers: {"Content-Type": "application/json"});

    return response;
  }

  Future<http.Response> emailVerify(String code, int userId) async{

    final data = jsonEncode({'user_id': userId, 'verified': code});

    final response = await http.post(
        Uri.parse('http://ehoaapp.techexposys.com/api/verify-email'),
        body: data,
        headers: {"Content-Type": "application/json"});

    return response;
  }

  Future<http.Response> logOutUser() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    final response = await http.post(
        Uri.parse('http://ehoaapp.techexposys.com/api/logout/?id=$userId&token=$token'),
        headers: {"Content-Type": "application/json"});

    return response;
  }

}