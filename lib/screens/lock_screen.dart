import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ScreenLockPage extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<void> _authenticate() async {
    try {
      bool isAuthenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        )
      );

      if (isAuthenticated) {
        // Authentication successful, proceed to the app
        print('Authentication successful');
      } else {
        // Authentication failed
        print('Authentication failed');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Lock Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _authenticate,
          child: Text('Authenticate'),
        ),
      ),
    );
  }
}
