import 'dart:convert';

import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GetAPIService{

  late Map<String, dynamic> albums = {};
  bool? error;

  Future<http.Response> login(String email, String pass) async{

      final response = await http.post(Uri.parse(
          "http://ehoaapp.techexposys.com/api/login?"
              "email=$email"
              "&password=$pass")
      );

      // print(response.body);
      return response;

  }


  Future<Map<String, dynamic>> fetchSymptoms(DateTime date) async {
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-symptoms/"
              "$userId/"
              "$token/"
              "$formattedDate")
      );

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        print("symptome: $albumData");
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchTermsAndConditions() async {
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();


    print('toke : $token');
    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-help-data/3/5/VHrZZboHtonZuDp0j96c4GwxiSq1epvYLNS86uYvKH42lVLlgBReTn6c5xoFJGD2")
      ); // Use toIso8601String for date formatting

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }
  Future<Map<String, dynamic>> fetchHelp() async {
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();


    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-help-data/25/5/VHrZZboHtonZuDp0j96c4GwxiSq1epvYLNS86uYvKH42lVLlgBReTn6c5xoFJGD2")
      ); // Use toIso8601String for date formatting

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }
  Future<Map<String, dynamic>> fetchInfo() async {
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();


    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-app-info/26/5/VHrZZboHtonZuDp0j96c4GwxiSq1epvYLNS86uYvKH42lVLlgBReTn6c5xoFJGD2")
      ); // Use toIso8601String for date formatting

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }




  Future<Map<String, dynamic>> fetchPrediction() async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
        "http://ehoaapp.techexposys.com/api/predictions-id-date/$userId/$token"));


      print('response code is: ${response.statusCode}');
        if (response.statusCode == 200) {
          final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
          error = false;
          // print(albumData);
          return albumData;
        } else {
          // Handle error based on response status code
          throw Exception('API request failed with status code: ${response.statusCode}');
        }

        } catch (e) {
        // Handle network errors
        // throw Exception('API request failed: $e');
        return albums;
      }


  }

  Future<Map<String, dynamic>> fetchStates() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-states/"
              "$userId/"
              "$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchMaritalStatus() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/marital-status/"
              "$userId/"
              "$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchBlogsList() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-blogs/$userId/$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }
  Future<Map<String, dynamic>> fetchBlogSlides(int blogId) async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    var id = blogId;
    print(id);
    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-blogs-slides/$id/$userId/$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchCalendarList(DateTime month) async{



    // print(monthNum.runtimeType);

    try {
      int monthNum = month.month;
      var userId = await PreferencesManager.getUserId();
      var token = await PreferencesManager.getUserToken();
      print("here");
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/calander-list-screen-user/"
              "$userId/"
              "$monthNum/"
              "$token"));

      // print(response.statusCode);
      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        print('list: $albumData');
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      print(e);
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchProfile() async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-users/"
              "$userId/"
              "$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }
  Future<Map<String, dynamic>> fetchUserNameImage() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/image-profile/"
              "$userId/"
              "$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }


  Future<Map<String, dynamic>> fetchHomeScreen() async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/home-screen/"
              "$userId/"
              "$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchEnergies() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/4/$userId/$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchLiveliness() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/2/$userId/$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchFeelings() async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/3/$userId/$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }

  Future<Map<String, dynamic>> fetchFlow() async{

    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/1/$userId/$token"));

      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body) as Map<String, dynamic>; // Cast to Map<String, dynamic>
        error = false;
        // print(albumData);
        return albumData;
      } else {
        // Handle error based on response status code
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      // throw Exception('API request failed: $e');
      return albums;
    }

  }



}
