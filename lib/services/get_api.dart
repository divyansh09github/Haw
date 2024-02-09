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
          "$apiUrl/api/show-symptoms?"
              "id=$userId"
              "&date=$formattedDate")
      ); // Use toIso8601String for date formatting

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

  // Future<Map> fetchSymptoms(DateTime date) async{
  //
  //   final response = await http.get(Uri.parse(
  //       "$apiUrl"
  //       "/api/show-symptoms?"
  //       "id=23"
  //       "&date=$date")
  //   );
  //
  //   if(response.statusCode == 200) {
  //     final albumData = json.decode(response.body);
  //
  //     return albumData;
  //
  //   }
  //
  // }

  Future<Map<String, dynamic>> fetchPrediction() async{
    var userId = await PreferencesManager.getUserId();
    var token = await PreferencesManager.getUserToken();

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/predictions-id-date/$userId"));


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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-states"));

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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/marital-status"));

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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-blogs"));

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

    var id = blogId;
    print(id);
    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-blogs-slides/$id"));

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
          "http://ehoaapp.techexposys.com/api/calander-list-screen-user/$userId/$monthNum"));

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
              "$userId"));

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
          "http://ehoaapp.techexposys.com/api/home-screen/$userId"));

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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/4"));

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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/2"));

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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/3"));

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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/show-disorders/1"));

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
