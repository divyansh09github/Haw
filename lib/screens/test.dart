import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:haw/api/post.dart';
import 'package:http/http.dart' as http;
import 'package:haw/constants/constants.dart' as constants;

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Map<String, dynamic> albums = {};



  Future fetchData() async {
    String fetchAPI = "/api/show-users/3";
    String url = constants.apiUrl + fetchAPI;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final albumData = json.decode(response.body);

      if (albumData is Map<String, dynamic>) {
        setState(() {
          // albums.add(albumData);
          albums = albumData;
          print(albums);
          print(albums['show_user'][0]['name']);
          // print(albums['show_user'])
        });
        // for (var album in albums) {
        //   // print(album);
        //
        //   // print(album['show_user'][0]['name']);
        //   // print(album['show_user'][0]['id']);
        //   // print(album['name']); // Access specific elements like 'name'
        // }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(


        child: ElevatedButton(
          onPressed: () {
            fetchData();
          // print(albums);
          // print(albums[0]['name']);

          },
          child: Text('Click Me'),

        )


    );
  }
}
