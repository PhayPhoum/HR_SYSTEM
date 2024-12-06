// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers to capture user input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Key to identify the form
  final _formKey = GlobalKey<FormState>();

  // Function to handle login logic
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement authentication logic here
      // For this template, we'll navigate to the HomeScreen directly
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF122133), // Background color
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            padding: const EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1B3351), // Form background color
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.3), // Darker shadow for contrast
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey, // Assign the form key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo or Image
                  Image.asset(
                    'assets/images/icon.png', // Updated to a supported image format

                    width: 100,
                  ),
                  const SizedBox(height: 20.0),
                  // Welcome Text
                  const Text(
                    'សិរីឧត្តម មីក្រូហិរញ្ញវត្ថុ ភីអិលស៊ី',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Hanuman',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40.0),

                  // Username Text Field
                  TextFormField(
                    controller: _usernameController,
                    style: const TextStyle(
                        color: Colors.white), // Text color for visibility
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle:
                          const TextStyle(color: Colors.white), // Label color
                      prefixIcon: const Icon(Icons.person, color: Colors.blue),
                      filled: true,
                      fillColor:
                          Colors.grey[700], // Adjusted for better contrast
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none, // Remove default border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // Password Text Field
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(
                        color: Colors.white), // Text color for visibility
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          const TextStyle(color: Colors.white), // Label color
                      prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                      filled: true,
                      fillColor:
                          Colors.grey[700], // Adjusted for better contrast
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none, // Remove default border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true, // Hide the password
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24.0),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: 'DMSans'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
