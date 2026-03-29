import 'package:flutter/material.dart';
// travel_spot.dart ashole models folder-e ache, tai path hobe eivabe:
import '../models/travel_spot.dart';
// admin_dashboard.dart jehetu eki folder-e (screens), tai eta thik thakbe:
import 'admin_dashboard.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller declare kora hoyeche input text dhorar jonno
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.lock_person, size: 80, color: Colors.orange),
              const SizedBox(height: 20),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Email TextField
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    // Admin Login Check
                    if (email == "admin@mail.com" && password == "admin123") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminDashboard(
                            currentSpots: spots, // travel_spot.dart theke spots list pathano hochche
                            onSpotsUpdated: (updatedList) {
                              // Dashboard theke fire ashar por data update hobe
                              setState(() {
                                spots = updatedList;
                              });
                            },
                          ),
                        ),
                      );
                    } else if (email.isNotEmpty && password.isNotEmpty) {
                      // Shadharon user hole login page bondho kore home-e niye jabe
                      Navigator.pop(context);
                    } else {
                      // Jodi field khali thake
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter valid credentials")),
                      );
                    }
                  },
                  child: const Text("Login", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Memory leak rodh korte controller dispose kora bhalo
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}