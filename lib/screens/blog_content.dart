import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/blogs.dart';
import 'package:haw/services/get_api.dart';

class BlogContent extends StatefulWidget {
  BlogContent({super.key, required this.blogId});

  late int blogId;

  @override
  State<BlogContent> createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  final ScrollController _scrollController = ScrollController();

  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchContent();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  String error = '';
  late Map<String, dynamic> blogSContentData = {};
  bool showPage = false;
  _fetchContent() async {
    try {
      final data = await GetAPIService().fetchBlogSlides(widget.blogId);
      if (data.isNotEmpty) {
        setState(() {
          blogSContentData = data;

          error = '';
        });
        if (blogSContentData['show_blogs_slides']['blogs_slides'].length != 0) {
          showPage = true;
        }
      } else {
        loadingProcess();
      }
    } catch (e) {
      setState(() {
        showPage = false;
        error = 'Failed to fetch blog List: $e';
      });
    }

    print(
        'slide len is : ${blogSContentData['show_blogs_slides']['blogs_slides'].length}');
    print(
        'slide content is : ${blogSContentData['show_blogs_slides']['blogs_slides'][0]['slide_title']}');
  }

  loadingProcess() {
    Future.delayed(Duration(seconds: 5), () {
      // After 10 seconds, show a snackbar
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            'Low internet connection',
            style: TextStyle(color: Color(0xFF972633)),
          ),
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
            .push(MaterialPageRoute(builder: (context) => Blogs()));
      });
    });
  }

  Widget buildContentSlide(Map<String, dynamic> data, int i) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //Header with back and forth arrows
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Scroll to previous slide
                    _scrollController.animateTo(
                      _scrollController.offset -
                          MediaQuery.of(context).size.width * 0.85,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  },
                  child: Padding(
                    // Add padding to adjust the icon position within the card border
                    padding:
                        EdgeInsets.only(right: 0), // Pad from the right edge
                    child: Image.asset(
                      "assets/images/arrowPinkback.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    // Image.asset(
                    //   "assets/images/arrow_blog_backward.png",
                    //   width: 25,
                    //   height: 25,
                    // )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Center(
                    child: Text(
                      '${data['slide_title']}',
                      // "Blog Title - 01",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.32,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Scroll to next slide
                    _scrollController.animateTo(
                      _scrollController.offset +
                          MediaQuery.of(context).size.width * 0.85,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Padding(
                    // Add padding to adjust the icon position within the card border
                    padding:
                        EdgeInsets.only(right: 0), // Pad from the right edge
                    child: Image.asset(
                      "assets/images/arrowPinkForward.png",
                      height: 20,
                      width: 20,
                    ),
                    // Image.asset(
                    //   "assets/images/arrow_blog_forward.png",
                    //   width: 25,
                    //   height: 25,
                    // )
                  ),
                ),
              ],
            ),
          ),

          //Blog Content
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.network(
                    '$apiUrl/public/${data['slide_image']}',
                    // 'assets/images/blogImage.png',
                    fit: BoxFit.contain,
                  ),
                  // Image.asset(
                  //   "assets/images/blogcontentdummy.png",
                  //   height: 25,
                  //   width: 25,
                  // ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  '$apiUrl/public/${data['slide_description']}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showPage
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(
                  height: 70,
                ),

                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 30),
                          //   child:
                          Image.asset(
                        "assets/images/arrowPinkback.png",
                        height: 25,
                        width: 25,
                      ),
                      // ),
                    ),
                    Container(
                      width: 60, // Adjust the width to your desired size
                      height: 60, // Adjust the height to your desired size
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            8), // Adjust the padding as needed
                        child: Image.asset(
                          'assets/images/blogImage.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //Blog content Container
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: backgroundColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController, // Define a ScrollController
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 5),
                        for (int i = 0;
                            i <
                                blogSContentData['show_blogs_slides']
                                        ['blogs_slides']
                                    .length;
                            i++)
                          Row(
                            children: [
                              SizedBox(width: 5),
                              buildContentSlide(
                                  blogSContentData['show_blogs_slides']
                                      ['blogs_slides'][i],
                                  i),
                              SizedBox(width: 5),
                            ],
                          ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            //Implement loader
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 30),
                          //   child:
                          Image.asset(
                        "assets/images/arrowPinkback.png",
                        height: 25,
                        width: 25,
                      ),
                      // ),
                    ),
                    Container(
                      width: 60, // Adjust the width to your desired size
                      height: 60, // Adjust the height to your desired size
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            8), // Adjust the padding as needed
                        child: Image.asset(
                          'assets/images/blogImage.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(150.0),
                      child: Image.network(
                          "https://cdn.pixabay.com/animation/2023/05/02/04/29/04-29-06-428_512.gif"),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
