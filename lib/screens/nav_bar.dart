import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/screens/blogs.dart';
import 'package:haw/screens/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

}

class _NavBarState extends State<NavBar>{

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero, // Removes padding
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User Name', style: TextStyle(color: Colors.black),),
            accountEmail: Text('username@gmail.com', style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFF608B),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                  AssetImage("assets/images/profilebg.png")
                  // NetworkImage(
                  //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gamesindustry.biz%2Fa-look-into-the-implementation-of-menstrual-leave&psig=AOvVaw122BuG4yEp9e_GJq5IVpW3&ust=1704957361331000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCNCQy6yj0oMDFQAAAAAdAAAAABAE')
              ),
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
            leading: Icon(Icons.health_and_safety),
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
            leading: Icon(Icons.health_and_safety_outlined),
            iconColor: Color(0xFFFF608B),
            title: Text('Health'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            iconColor: Color(0xFFFF608B),
            title: Text('Ayurveda'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.accessibility_sharp),
            iconColor: Color(0xFFFF608B),
            title: Text('Yoga'),
            onTap: () {},
            // trailing: ClipOval(
            //   child: Container(
            //     color: Colors.red,
            //     width: 20,
            //     height: 20,
            //     child: Center(
            //       child: Text(
            //         '8',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 12,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          // Divider(),

          ListTile(
            leading: Icon(Icons.music_note),
            iconColor: Color(0xFFFF608B),
            title: Text('Music'),
            onTap: () {},
          ),
          Divider(color: Color(0xFFFF608B)),
          ListTile(
            leading: Icon(Icons.settings),
            iconColor: Color(0xFFFF608B),
            title: Text('Settings'),
            onTap: () {},
            trailing: ClipOval(
              child: Container(
                color: Color(0xFFFF608B),
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('SignOut'),
            leading: Icon(Icons.exit_to_app),
            iconColor: Color(0xFFFF608B),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
