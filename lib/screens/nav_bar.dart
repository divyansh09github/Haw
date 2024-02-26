import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/constants/constants.dart';
import 'package:haw/screens/blogs.dart';
import 'package:haw/screens/data_calendar_1.dart';
import 'package:haw/screens/data_calendar_list.dart';
import 'package:haw/screens/get_started_page.dart';
import 'package:haw/screens/lock_screen.dart';
import 'package:haw/screens/login_screen.dart';
import 'package:haw/screens/navbar_settings.dart';
import 'package:haw/screens/pinput_screen.dart';
import 'package:haw/screens/profile.dart';
import 'package:haw/services/get_api.dart';
import 'package:haw/services/post_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

}

class _NavBarState extends State<NavBar>{

  Color backgroundColor = const Color(0xFFFFDFE9);

  String userName = 'User';
  @override
  void initState(){
    super.initState();


    _getNameImageAPI();
  }
  late Map<String, dynamic> nameImageData = {};
  String error = '';
  bool isLoading = false;


  _getNameImageAPI() async{
    try {
      final data = await GetAPIService().fetchUserNameImage();
      setState(() {
        nameImageData = data;
        isLoading = true;
        error = '';
      });
      await PreferencesManager.setUserName(nameImageData['name']);

    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch Profile: $e';
      });
    }

    print(nameImageData['name']);
  }


  _signOut() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    var response = await PostAPIService().logOutUser();

    _navigateToGetStarted();
  }

  _navigateToGetStarted() {
    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()),);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false,
    );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        // padding: EdgeInsets.zero, // Removes padding
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
            accountEmail:
            isLoading ? Text("Hello ${nameImageData['name']?.split(' ')[0] ?? "Username"}", style: TextStyle(color: Color(0xFFFF608B), fontSize: 20, fontWeight: FontWeight.w500))
            : Text("", style: TextStyle(color: Color(0xFFFF608B), fontSize: 20, fontWeight: FontWeight.w500)),
            //Round profile image container
            currentAccountPicture: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4)),
                child:nameImageData['image'] != null
                ? CircleAvatar(
              backgroundImage: NetworkImage('$apiUrl/public/${nameImageData['image']}'),
              radius: 100,
            ) : CircleAvatar(
              backgroundImage: AssetImage('assets/images/profileimage.png',),
              radius: 100,
            )),
            // Column(
            //   children: [
            //     // SizedBox(height: 4,),
            //     Container(
            //       // width: 130,
            //       // height: 130,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(color: Colors.white, width: 4), // Add border to the circle
            //       ),
            //       child: ClipOval(
            //         child: nameImageData['image'] != null
            //             ? Image.network(
            //           '$apiUrl/public/${nameImageData['image']}',
            //           fit: BoxFit.cover,
            //         )
            //             : Image.asset(
            //           'assets/images/profileimage.png',
            //           fit: BoxFit.cover,
            //         ),
            //         // child:
            //         // Image.network(
            //         //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
            //         //   fit: BoxFit.cover,
            //         //   width: 60,
            //         //   height: 60,
            //         // ),
            //       ),
            //     ),
            //   ],
            // ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/navbarHeader.jpg'), // Replace with your actual image path
                fit: BoxFit.fill, // Ensures image covers the entire background
              ),

              // You can add background image if needed
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage("assets/images/profilebg.png"),
              // ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            iconColor: Color(0xFFFF608B),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          Divider(color: Color(0xFFFF608B)),
          ListTile(
            // leading: Icon(Icons.file_present),
            leading: Image.asset("assets/images/reportnavbaricon.png",
            width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            title: Text('Report'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DCalendar()),
              // );
            },
          ),
          ListTile(
            leading: Image.asset("assets/images/blogImage.png",
              width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            title: Text('Blogs'),
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Blogs()),
                  );
            },
          ),
          // ListTile(
          //   leading: Image.asset("assets/images/tipsnavbaricon.png",
          //     width: 25,
          //     height: 25,
          //   ),
          //   iconColor: Color(0xFFFF608B),
          //   title: Text('Tips'),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Image.asset("assets/images/healthnavbaricon.png",
              width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            title: Text('Health'),
            onTap: () {},
            trailing:
            Container(
                color: Colors.transparent,
                width: 80,
                height: 30,
                child: Center(
                  child: Text(
                    'Coming Soon',
                    style: TextStyle(
                      color: Color(0xFFFF608B),
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),

          ),
          // Divider(),

          ListTile(
            leading: Image.asset("assets/images/consultationnavbaricon.png",
              width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            title: Text('Consultation'),
            onTap: () {},
            trailing: Container(
              color: Colors.transparent,
              width: 80,
              height: 30,
              child: Center(
                child: Text(
                  'Coming Soon',
                  style: TextStyle(
                    color: Color(0xFFFF608B),
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
          Divider(color: Color(0xFFFF608B)),
          // ExpansionTile(
          //   leading: Image.asset("assets/images/settingsnavbaricon.png", width: 25, height: 25),
          //   iconColor: Color(0xFFFF608B),
          //   title: Text('Settings'),
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40.0),
          //       child: ListTile(
          //         leading: Icon(Icons.lock),
          //         iconColor: Color(0xFFFF608B),
          //         title: Text('App Lock'),
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => LockScreen()),
          //           );
          //         },
          //         trailing: Switch(
          //           activeColor: Color(0xFFFF608B),
          //           value: _appLockEnabled, // Replace with your app lock state variable
          //           onChanged: (value) => setState(() => _appLockEnabled = value), // Update app lock state
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40.0),
          //       child: ListTile(
          //         leading: Icon(Icons.help),
          //         iconColor: Color(0xFFFF608B),
          //         title: Text('Help'),
          //         onTap: () { },
          //       ),
          //     ),
          //     // Add more options as needed ...
          //   ],
          // ),

          ListTile(
            title: Text('Settings'),
            leading: Image.asset("assets/images/settingsnavbaricon.png", width: 25, height: 25),
            iconColor: Color(0xFFFF608B),

            trailing: Icon(Icons.arrow_forward_ios,size: 20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavbarSettings()),
              );
            },
          ),
          ListTile(
            title: Text('SignOut'),
            leading: Image.asset("assets/images/signoutnavbaricon.png",
              width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            onTap: (){
              _signOut();
            },
          ),
        ],
      ),
    );
  }
}
