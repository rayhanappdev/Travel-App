import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
              SizedBox(height: 15),
              TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder())),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                child: Text("Create Account"),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}