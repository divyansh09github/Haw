import 'dart:convert';

import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GetAPIService{

  late Map<String, dynamic> albums = {};
  bool? error;


  Future<Map<String, dynamic>> fetchSymptoms(DateTime date) async {

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    try {
      final response = await http.get(Uri.parse(
          "$apiUrl/api/show-symptoms?"
              "id=23"
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

    try {
      final response = await http.get(Uri.parse(
          "http://ehoaapp.techexposys.com/api/predictions-id-date/23"));

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




}
