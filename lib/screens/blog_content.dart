import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogContent extends StatefulWidget {
  const BlogContent({super.key});

  @override
  State<BlogContent> createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
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
                  padding:
                      const EdgeInsets.all(8), // Adjust the padding as needed
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
                borderRadius: BorderRadius.circular(5)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          // Add padding to adjust the icon position within the card border
                            padding:
                            EdgeInsets.only(right: 0), // Pad from the right edge
                            child: Image.asset(
                              "assets/images/arrow_blog_backward.png",
                              width: 25,
                              height: 25,
                            )
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: Text(
                              "Blog Title - 01",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.32,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          // Add padding to adjust the icon position within the card border
                            padding:
                            EdgeInsets.only(right: 0), // Pad from the right edge
                            child: Image.asset(
                              "assets/images/arrow_blog_forward.png",
                              width: 25,
                              height: 25,
                            )
                        ),
                      ],
                    ),
                  ),
                  Column(

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
