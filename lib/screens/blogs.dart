import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/services/get_api.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {

  late Map<String, dynamic> blogsData = {};
  late Map<String, dynamic> blogSlideData = {};
  String error = '';
  bool showPage = false;

  var blogLen;
  var slideLen;

  @override
  void initState() {
    super.initState();

    _getBlogsList();

  }

  loadingProcess(){
    Future.delayed(Duration(seconds: 5), () {
      // After 10 seconds, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.all(10),
          content: Text('Low internet Connection'),
          backgroundColor: Color(0xBAFF608B),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(15),
        ),
      );

      // Navigate to another page after 8 seconds (5 seconds for loading + 3 seconds for snackbar)
      Future.delayed(Duration(seconds: 3), () {
        // Replace 'YourNextPage()' with the actual page you want to navigate to
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavBar()));
      });
    });
  }

  _getBlogsList() async{
    try {
      final data = await GetAPIService().fetchBlogsList();
      if(data.isNotEmpty){
        setState(() {
          blogsData = data;
          showPage = true;
          error = '';
        });
      }
      else{
        loadingProcess();
      }

    } catch (e) {
      setState(() {
        showPage = false;
        error = 'Failed to fetch blog List: $e';
      });
    }

    setState(() {
      blogLen = blogsData['show_blogs']['blogs'].length;
    });
    // print(blogsData['show_blogs']['blogs'].length);

  }

  _getBlogSlides(int blogId) async{
    try {
      final data = await GetAPIService().fetchBlogSlides(blogId);
      setState(() {
        blogSlideData = data;
        // showPage = true;
        error = '';
      });
    } catch (e) {
      setState(() {
        // showPage = false;
        error = 'Failed to fetch blog slides: $e';
      });
    }

    setState(() {
      slideLen = blogSlideData['show_blogs_slides']['blogs_slides'].length;
    });
  }

  Widget buildBottomDrawer(int blogId){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(15)), color: Colors.black12, ),
      height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
      width: MediaQuery.of(context).size.width * 1,
      // color: Colors.deepOrange, // Customize the bottom sheet background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible( // Or Expanded
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // for(var i=0; i<80; i++)
                  //   Text("data"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for(var i=0; i < slideLen; i++)
                          Row(
                            children: [
                              SizedBox(width: 15),
                              buildBlogSlide(i),
                              SizedBox(width: 15),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBlogSlide(int slideId){
    return Container(
      decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15)),border: Border.all(color: Colors.black)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Column(
          //   children: [
          Container(
            height: 50,
            width: 50,
            child: Image.asset(
              // "assets/images/veryLowEnergy.png",
              blogSlideData['show_blogs_slides']['blogs_slides'][slideId]['slide_image'],
              fit: BoxFit.contain,
            ),
          ),
          Text(blogSlideData['show_blogs_slides']['blogs_slides'][slideId]['slide_title']),
          // ],
          // ),

        ],
      ),
    );
  }


  Widget buildBlogCards(Map<String, dynamic> data, int index, BuildContext context){
    return Builder(
      builder: (context) => GestureDetector(
      onTap: () async{
        // Handle card tap here
        // print('Card tapped!'); // Replace with your desired action
        // print(data['show_blogs']['blogs'][index]['blog_id']);
        // Scaffold.of(context).openDrawer();

        await _getBlogSlides(data['blog_id']);

        showModalBottomSheet(
          barrierColor: Colors.black26,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return buildBottomDrawer(index);
          },
        );
      },

      // onTap: () {
      //   try {
      //     Scaffold.of(context).openDrawer();
      //   } catch (e) {
      //     // Handle the error gracefully, e.g., display a snackbar or log a message
      //     print("Error opening drawer: $e");
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("Failed to open drawer")),
      //     );
      //   }
      // },

      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  data['image'],
                  // "assets/images/veryLowEnergy.png",
                  fit: BoxFit.contain,
                ),
              ),
              Text(data['title']),
            ],
          ),
        ),
      ),
    ),);

  }

  // Widget buildBlogDrawer(){
  //   return Column(
  //     children: [
  //       Text("data"),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return showPage ? Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              for(var i =0; i < blogLen; i++)
                Column(
                  children: [
                    SizedBox(height: 5),
                    buildBlogCards(blogsData['show_blogs']['blogs'][i], i, context),
                    SizedBox(height: 5),
                  ],
                )
            ],
          ),
        ),
      ),

      endDrawer: Drawer(
        child: Column(
          children: [
            Text("data"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    )
    : Scaffold(
      //Implement loader
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(180.0),
            child: Image.network("https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
          ),
        ],
      ),
    );
  }
}
