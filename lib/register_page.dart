import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dummy_api.dart'; // Import file dummy_api.dart

class RegisterPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  void _speak(String text) async {
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onTap: () {
                _speak('Name field selected');
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onTap: () {
                _speak('Email field selected');
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onTap: () {
                _speak('Password field selected');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Registrasi user
                String name = 'John Doe';
                String email = 'john.doe@example.com';
                String password = 'password123';

                if (DummyApi.registeredUsers.containsKey(email)) {
                  _speak('Email has been used. Please use another email.');
                } else {
                  DummyApi.registerUser(name, email, password);

                  // Cek apakah user terdaftar
                  bool isRegistered = DummyApi.registeredUsers.containsKey(email);
                  if (isRegistered) {
                    _speak('Registration successful');
                  } else {
                    _speak('Registration failed');
                  }
                }
              },
              child: Text('Register'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Click here to login.'),
            ),
          ],
        ),
      ),
    );
  }
}
