import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/blog_content.dart';
import 'package:haw/screens/bottom_nav_bar.dart';
import 'package:haw/screens/nav_bar.dart';
import 'package:haw/services/get_api.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  Color backgroundColor = const Color(0xFFFFDFE9);

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

  loadingProcess() {
    Future.delayed(Duration(seconds: 5), () {
      // After 10 seconds, show a snackbar
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Text(
          'Low internet connection',
          style: TextStyle(color: Color(0xFF972633)),
        ),
        backgroundColor: Color(0xFFfedbd5), // Or any other desired background color
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15), // Customize corner radius as needed
          ),
        ),
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(snackDemo);

      // Navigate to another page after 8 seconds (5 seconds for loading + 3 seconds for snackbar)
      Future.delayed(Duration(seconds: 3), () {
        // Replace 'YourNextPage()' with the actual page you want to navigate to
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NavBar()));
      });
    });
  }

  _getBlogsList() async {
    try {
      final data = await GetAPIService().fetchBlogsList();
      if (data.isNotEmpty) {
        setState(() {
          blogsData = data;
          showPage = true;
          error = '';
        });
      } else {
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
    print(blogsData);
  }

  // _getBlogSlides(int blogId) async {
  //   try {
  //     final data = await GetAPIService().fetchBlogSlides(blogId);
  //     setState(() {
  //       blogSlideData = data;
  //       // showPage = true;
  //       error = '';
  //     });
  //   } catch (e) {
  //     setState(() {
  //       // showPage = false;
  //       error = 'Failed to fetch blog slides: $e';
  //     });
  //   }
  //
  //   setState(() {
  //     slideLen = blogSlideData['show_blogs_slides']['blogs_slides'].length;
  //   });
  // }

  // Widget buildBottomDrawer(int blogId) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20), topRight: Radius.circular(15)),
  //       color: Colors.black12,
  //     ),
  //     height: MediaQuery.of(context).size.height *
  //         0.8, // Adjust the height as needed
  //     width: MediaQuery.of(context).size.width * 1,
  //     // color: Colors.deepOrange, // Customize the bottom sheet background color
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Flexible(
  //           // Or Expanded
  //           child: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 // for(var i=0; i<80; i++)
  //                 //   Text("data"),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     children: [
  //                       for (var i = 0; i < slideLen; i++)
  //                         Row(
  //                           children: [
  //                             SizedBox(width: 15),
  //                             buildBlogSlide(i),
  //                             SizedBox(width: 15),
  //                           ],
  //                         ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildBlogSlide(int slideId) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         shape: BoxShape.rectangle,
  //         borderRadius: BorderRadius.all(Radius.circular(15)),
  //         border: Border.all(color: Colors.black)),
  //     width: MediaQuery.of(context).size.width * 0.9,
  //     height: MediaQuery.of(context).size.height * 0.7,
  //     child: Column(
  //       // mainAxisAlignment: MainAxisAlignment.center,
  //       // crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         // Column(
  //         //   children: [
  //         Container(
  //           height: 50,
  //           width: 50,
  //           child: Image.asset(
  //             // "assets/images/veryLowEnergy.png",
  //             blogSlideData['show_blogs_slides']['blogs_slides'][slideId]
  //                 ['slide_image'],
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         Text(blogSlideData['show_blogs_slides']['blogs_slides'][slideId]
  //             ['slide_title']),
  //         // ],
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  Widget buildBlogCards(
      Map<String, dynamic> data, int index, BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () async {
          // Handle card tap here
          // print('Card tapped!'); // Replace with your desired action
          // print(data['show_blogs']['blogs'][index]['blog_id']);
          // Scaffold.of(context).openDrawer();

          // await _getBlogSlides(data['blog_id']);
          //
          // showModalBottomSheet(
          //   barrierColor: Colors.black26,
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) {
          //     return buildBottomDrawer(index);
          //   },
          // );

          int blogId = data['blog_id'];

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlogContent(blogId: blogId)));
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

        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                color: backgroundColor,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Column(
                          //   // crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       // decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFFFA0BA), width: 8, style: BorderStyle.solid), left: BorderSide(color: Color(0xFFFFA0BA), width: 8, style: BorderStyle.solid,),)),
                          //       height: 90,
                          //       width: 90,
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(left: 4, top: 4),
                          //         child: Image.asset(
                          //           data['image'],
                          //           // "assets/images/veryLowEnergy.png",
                          //           fit: BoxFit.contain,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                child: Stack(
                                  children: [
                                    // Background image
                                    Positioned.fill(
                                      child: Image.asset(
                                        'assets/images/blog_card_border.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // Foreground image with border
                                    Positioned(
                                      left: 10,
                                      top: 10,
                                      child: Container(
                                          width:
                                              80, // Adjust the width to leave space for the border
                                          height:
                                              80, // Adjust the height to leave space for the border
                                          // decoration: BoxDecoration(
                                          //   border: Border.all(color: Color(0xFFFFA0BA), width: 8, style: BorderStyle.solid),
                                          //   borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                                          // ),
                                          child:
                                              // ClipRRect(
                                              //   borderRadius: BorderRadius.circular(8),
                                              //   child: Image.asset(
                                              //     data['image'],
                                              //     // 'assets/images/blogImage.png',
                                              //     fit: BoxFit.contain,
                                              //   ),
                                              // ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: data['image'] != null
                                                ? Image.network(
                                              '$apiUrl/public/${data['image']}',
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error, stackTrace) {
                                                // Handle image loading errors gracefully
                                                return Image.asset(
                                                  'assets/images/blogImage.png', // Replace with your placeholder image
                                                  fit: BoxFit.contain,
                                                );
                                              },
                                            )
                                                : Image.asset(
                                              'assets/images/blogImage.png', // Replace with your "no image" image
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    data['title'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.96,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.end ,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Container(
                          //         width: 70,
                          //         child: Text('25 Jan, 2024',
                          //             style: TextStyle(
                          //               letterSpacing: 0.72,
                          //               fontSize: 10,
                          //               fontWeight: FontWeight.w400,
                          //             )),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 2, // Right edge of the card
              top: 0, // Top edge of the card
              child: SizedBox(
                height: 100, // Same height as the card
                child: Align(
                  alignment: Alignment
                      .centerRight, // Center horizontally within the SizedBox
                  child: Padding(
                      // Add padding to adjust the icon position within the card border
                      padding:
                          EdgeInsets.only(right: 0), // Pad from the right edge
                      child: Image.asset(
                        "assets/images/arrow_blog_forward.png",
                        width: 25,
                        height: 25,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    return showPage
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Image.asset(
                        'assets/images/profile_header_img.png', // Replace with your first image path
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 20,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/images/backArrowWhite.png",
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15, // Adjust the bottom position as needed
                      left: (MediaQuery.of(context).size.width - 120) / 2,
                      child: Column(
                        children: [
                          // Text("Username", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 4)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/images/blogImage.png', // Replace with your second image path
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Text("Change Picture",
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w400)
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    // child: Center(
                    child: Column(
                      children: [
                        // SizedBox(height: 10),
                        for (var i = 0; i < blogLen; i++)
                          Column(
                            children: [
                              SizedBox(height: 5),
                              buildBlogCards(
                                  blogsData['show_blogs']['blogs'][i],
                                  i,
                                  context),
                              SizedBox(height: 5),
                            ],
                          )
                      ],
                    ),
                    // ),
                  ),
                ),
              ],
            ),

            // endDrawer: Drawer(
            //   child: Column(
            //     children: [
            //       Text("data"),
            //     ],
            //   ),
            // ),
            // bottomNavigationBar: BottomNavBar(),
          )
        : Scaffold(
            //Implement loader
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(180.0),
                  child: Image.network(
                      "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                ),
              ],
            ),
          );
  }
}
