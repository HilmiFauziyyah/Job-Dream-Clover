// Import libraries
import 'package:flutter/material.dart';
import 'package:job_dream/app/modules/auth/register/views/register_page.dart';
import 'package:job_dream/app/modules/auth/verif/views/forgot_password_page.dart';
import 'package:job_dream/app/widgets/primary_button.dart';
import 'package:job_dream/app/widgets/secondary_button.dart';
import 'package:logger/logger.dart';
import 'package:job_dream/app/modules/auth/controller/auth_controller.dart';
import 'package:job_dream/app/modules/home/views/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Logger logger = Logger();
  late final AuthController loginService;

  @override
  void initState() {
    super.initState();
    loginService = AuthController();
  }

  void _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final isSignedIn = await loginService.signInWithEmailAndPassword(
      email,
      password,
    );

    if (isSignedIn != null) {
      logger.i('Login successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      logger.e('Login failed');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/img/sky.png', 
              width: 100, 
              height: 100, 
            ),
            const SizedBox(height: 20.0),
            const Text("Log in to your account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text(
              'Welcome back! Please enter your details',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30.0),

            // Textfield for email
            SizedBox(
              width: 350, // Specify the desired width
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),

            SizedBox(
              width: 350, // Specify the desired width
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            // Row for 'Forgot Password' text
            TextButton(
              onPressed: () {
                // Navigate to the Forgot Password page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 250.0),
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Color(0xFF96D8CC)),
                ),
              ),
            ),
            const SizedBox(height: 25.0),

            // ElevatedButton for 'Sign in'
            PrimaryButton("Sign in",
                onPressed: () {
                  _login();
                }),
            const SizedBox(height: 20.0),

            // Text for 'G Sign in with Google'
            SecondaryButton("Sign in With Google", onPressed: () {}),
            const SizedBox(height: 15.0),

            // Row for 'Don't have an account?' and 'Sign up' text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                const SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Color(0xFF96D8CC)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
