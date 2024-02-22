import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/services/get_api.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsHelp extends StatefulWidget {
  const SettingsHelp({super.key});

  @override
  State<SettingsHelp> createState() => _SettingsHelpState();
}

class _SettingsHelpState extends State<SettingsHelp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchHelp();
  }
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(

      onNavigationRequest: (request) {
        // Allow if URL matches the specified `allowedUrl`
        if (request.url.toString() == "https://haaw.in") {
          return NavigationDecision.navigate; // Allow navigation
        } else {
          return NavigationDecision.prevent; // Block navigation
        }
      },
    ))
    ..loadRequest(Uri.parse('https://haaw.in/help/')); // Load the webpage


  String error = '';
  bool isLoading = false;
  late Map<String, dynamic> helpData = {};
  _fetchHelp() async{

    try {
      final data = await GetAPIService().fetchHelp();
      if (data.isNotEmpty) {
        setState(() {
          helpData = data;
          isLoading = true;
          error = '';
        });
      }
      else{
        loadingProcess();
      }

    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch symptoms: $e';
      });
    }
    print(helpData);
  }
  loadingProcess() {
    Future.delayed(Duration(seconds: 10), () {

      _fetchHelp();

      // After 10 seconds, show a snackbar
      const snackDemo = SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        padding: EdgeInsets.all(7),
        content: Center(
          child: Text(
            "Low internet connection",
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
      // Future.delayed(Duration(seconds: 5), () {
      //   // Replace 'YourNextPage()' with the actual page you want to navigate to
      //   // Navigator.of(context)
      //   //     .push(MaterialPageRoute(builder: (context) => NavBar()));
      //   exit(0);
      // });
    });
  }


  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                        Padding(
                          padding: const EdgeInsets.only(left: 30,bottom: 10),
                          child:
                          Image.asset(
                            "assets/images/arrowPinkback.png",
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                      // Text(tncData['show_app_info'][0]['title'], style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                      SizedBox(),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.89,
                    width: MediaQuery.of(context).size.height * 0.9,
                    child: WebViewWidget(
                        controller: controller),
                  ),
                ],
              ),
            ))
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     SizedBox(
      //       height: 70,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //           child:
      //           // Padding(
      //           //   padding: const EdgeInsets.only(left: 30),
      //           //   child:
      //           Image.asset(
      //             "assets/images/arrowPinkback.png",
      //             height: 25,
      //             width: 25,
      //           ),
      //           // ),
      //         ),
      //         // Text(tncData['show_app_info'][0]['title'], style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
      //         SizedBox(),
      //         SizedBox(
      //           width: 25,
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 20,),
      //     Expanded(
      //       child: WebViewWidget(controller: controller)
      //       // SingleChildScrollView(
      //       //   scrollDirection: Axis.vertical,
      //       //   child: Column(
      //       //     mainAxisAlignment:
      //       //     MainAxisAlignment.spaceBetween, // Align children to the top
      //       //     crossAxisAlignment: CrossAxisAlignment.center,
      //       //     children: [
      //       //       Padding(
      //       //         padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      //       //         child: Column(
      //       //           mainAxisAlignment: MainAxisAlignment.start,
      //       //           crossAxisAlignment: CrossAxisAlignment.start,
      //       //           children: [
      //       //             // Text(
      //       //             //   "What is Lorem Ipsum?",
      //       //             //   style:
      //       //             //       TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      //       //             // ),
      //       //             SizedBox(height: 5,),
      //       //             Container(
      //       //               width: MediaQuery.of(context).size.width * 0.85,
      //       //               child: Padding(
      //       //                 padding: const EdgeInsets.all(8.0),
      //       //                 child: WebView(
      //       //                     initialUrl: 'https://www.google.com'
      //       //                 ),
      //       //                 // child: Text(
      //       //                 //   tncData['show_app_info'][0]['long_description'],textAlign: TextAlign.justify,
      //       //                 //   // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      //       //                 //   softWrap: true,
      //       //                 //   style:
      //       //                 //   TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
      //       //                 // ),
      //       //               ),
      //       //             ),
      //       //             SizedBox(height: 15,),
      //       //             // Text(
      //       //             //   "Why do we use it?",
      //       //             //   style:
      //       //             //   TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      //       //             // ),
      //       //             // SizedBox(height: 10,),
      //       //             // Container(
      //       //             //   child: Padding(
      //       //             //     padding: const EdgeInsets.all(8.0),
      //       //             //     child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and",
      //       //             //       softWrap: true,
      //       //             //       style:
      //       //             //       TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
      //       //             //     ),
      //       //             //
      //       //             //   ),
      //       //             // ),
      //       //           ],
      //       //         ),
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //
      //     ),
      //   ],
      // ),
    )
    // Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         height: 70,
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pop(context);
    //             },
    //             child:
    //             // Padding(
    //             //   padding: const EdgeInsets.only(left: 30),
    //             //   child:
    //             Image.asset(
    //               "assets/images/arrowPinkback.png",
    //               height: 25,
    //               width: 25,
    //             ),
    //             // ),
    //           ),
    //           Text(
    //           helpData['show_app_info'][0]['title'],
    //             // "Help",
    //             style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
    //           SizedBox(
    //             width: 25,
    //           ),
    //         ],
    //       ),
    //       SizedBox(height: 20,),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 5),
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             mainAxisAlignment:
    //             MainAxisAlignment.spaceBetween, // Align children to the top
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     // Text(
    //                     //   helpData['show_app_info'][0]['short_description'],
    //                     //   style:
    //                     //   TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    //                     // ),
    //                     SizedBox(height: 5,),
    //                     Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: Text(
    //                         helpData['show_app_info'][0]['long_description'],
    //                         softWrap: true,
    //                         textAlign: TextAlign.justify,
    //                         style:
    //                         TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
    //                       ),
    //                     ),
    //                     // SizedBox(height: 15,),
    //                     // Text(
    //                     //   "Why do we use it?",
    //                     //   style:
    //                     //   TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    //                     // ),
    //                     // SizedBox(height: 10,),
    //                     // Padding(
    //                     //   padding: const EdgeInsets.all(8.0),
    //                     //   child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and",
    //                     //     softWrap: true,
    //                     //     style:
    //                     //     TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
    //                     //   ),
    //
    //                     // ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // )
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
