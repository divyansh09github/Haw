import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/blogs.dart';
import 'package:haw/screens/lock_screen.dart';
import 'package:haw/screens/pinput_screen.dart';
import 'package:haw/screens/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

}

class _NavBarState extends State<NavBar>{

  Color backgroundColor = const Color(0xFFFFDFE9);

  bool _appLockEnabled = false;

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        // padding: EdgeInsets.zero, // Removes padding
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
            accountEmail: Text('Hello, Username', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
            currentAccountPicture: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4), // Add border to the circle
              ),
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 110,
                  height: 110,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFF608B),
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
              //   MaterialPageRoute(builder: (context) => Blogs()),
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
          ListTile(
            leading: Image.asset("assets/images/tipsnavbaricon.png",
              width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            title: Text('Tips'),
            onTap: () {},
          ),
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
                  ),
                ),
              ),
            ),
          ),
          Divider(color: Color(0xFFFF608B)),
          ExpansionTile(
            leading: Image.asset("assets/images/settingsnavbaricon.png", width: 25, height: 25),
            iconColor: Color(0xFFFF608B),
            title: Text('Settings'),
            children: [
              ListTile(
                title: Text('App Lock'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LockScreen()),
                  );
                },
                // trailing: Switch(
                //   activeColor: Color(0xFFFF608B),
                //   value: _appLockEnabled, // Replace with your app lock state variable
                //   onChanged: (value) => setState(() => _appLockEnabled = value), // Update app lock state
                // ),
              ),
              ListTile(
                title: Text('Dummy Setting'),
                onTap: () { },
              ),
              // Add more options as needed ...
            ],
          ),

          ListTile(
            title: Text('SignOut'),
            leading: Image.asset("assets/images/signoutnavbaricon.png",
              width: 25,
              height: 25,
            ),
            iconColor: Color(0xFFFF608B),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
