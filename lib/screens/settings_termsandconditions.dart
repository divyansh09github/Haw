import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTermsNConditions extends StatefulWidget {
  const SettingTermsNConditions({super.key});

  @override
  State<SettingTermsNConditions> createState() => _SettingTermsNConditionsState();
}

class _SettingTermsNConditionsState extends State<SettingTermsNConditions> {

  Color backgroundColor = const Color(0xFFFFDFE9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
              Text("Terms & Conditions", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Align children to the top
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is Lorem Ipsum?",
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            softWrap: true,
                            style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          "Why do we use it?",
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and",
                            softWrap: true,
                            style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 16,letterSpacing: 0.96,),
                          ),

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
}
