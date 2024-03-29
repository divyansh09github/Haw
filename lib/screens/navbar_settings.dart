import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haw/DataStorage/preferences_manager.dart';
import 'package:haw/screens/lock_screen.dart';
import 'package:haw/screens/settings_appinfo.dart';
import 'package:haw/screens/settings_help.dart';
import 'package:haw/screens/settings_termsandconditions.dart';

class NavbarSettings extends StatefulWidget {
  const NavbarSettings({super.key});

  @override
  State<NavbarSettings> createState() => _NavbarSettingsState();
}

class _NavbarSettingsState extends State<NavbarSettings> {

  Color backgroundColor = const Color(0xFFFFDFE9);
  bool _appLockEnabled = false;
  bool isPinSet = false;

  @override
  void initState() {
    // TODO: implement initState
    setLock();
    super.initState();

    _isPin();

  }

  _isPin() async{
  bool pin = await PreferencesManager.getIsPinSet();
  setState(() {
    isPinSet = pin;
  });
}
  setLock() async{
    bool abc = await PreferencesManager.getIsLockEnabled();
    setState(() {
      _appLockEnabled = abc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Text("Settings", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 0, 20),
                child: Text("Privacy & Security", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: ListTile(
              leading: Icon(Icons.lock),
              iconColor: Color(0xFFFF608B),
              title: Text('App Lock'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LockScreen()),
                // );
              },
              trailing: Container(
                width: 60,
                height: 40,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    activeColor: Color(0xFFFF608B),
                    value: _appLockEnabled,
                    onChanged: (value) async=>
                    {
                      if(value){
                        if(await PreferencesManager.getIsPinSet()){
                          PreferencesManager.setIsLockEnabled(value),
                          setState(() => _appLockEnabled = value)
                        }
                        else{
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LockScreen()),)
                        }
                      }else{
                        PreferencesManager.setIsLockEnabled(value),
                        setState(() => _appLockEnabled = value)
                      },
                    // PreferencesManager.setIsLockEnabled(value),
                    //   setState(() => _appLockEnabled = value)
                    },
                  ),
                ),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: ListTile(
              title: isPinSet ? Text('Reset Pin') : Text('Set Pin'),

              leading: Icon(Icons.pin),
              // Image.asset("assets/images/signoutnavbaricon.png",
              //   width: 25,
              //   height: 25,
              // ),
              iconColor: Color(0xFFFF608B),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LockScreen()),
                // );
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LockScreen()),);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help_sharp),
              // Image.asset("assets/images/signoutnavbaricon.png",
              //   width: 25,
              //   height: 25,
              // ),
              iconColor: Color(0xFFFF608B),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsHelp()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: ListTile(
              title: Text('Terms & Conditions'),
              leading: Icon(Icons.indeterminate_check_box_rounded),
              // Image.asset("assets/images/signoutnavbaricon.png",
              //   width: 25,
              //   height: 25,
              // ),
              iconColor: Color(0xFFFF608B),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingTermsNConditions()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: ListTile(
              title: Text('App info'),
              leading: Icon(Icons.info),
              // Image.asset("assets/images/signoutnavbaricon.png",
              //   width: 25,
              //   height: 25,
              // ),
              iconColor: Color(0xFFFF608B),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppInfo()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
