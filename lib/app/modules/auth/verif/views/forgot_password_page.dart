import 'package:flutter/material.dart';
import 'package:job_dream/app/widgets/primary_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Forgot Password',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40.0),
          Center(
            child: Image.asset(
              'assets/img/forgot.png', // Replace with the path to your image
              width: 200, // Specify the desired width
              height: 200, // Specify the desired height
            ),
          ),
          const Center(
            child: Text(
              "Don’t worry, it happens to the best of us. \n Recover your account with your seed phrase hello.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40.0),
          const Text(
            "Email Id",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: 380, // Specify the desired width
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          PrimaryButton("Continue", onPressed: () {}),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "If you remember own password ? \n you can login here ",
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
              ),
              const SizedBox(width: 100.0),
              TextButton(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize:16,fontWeight: FontWeight.normal,color:  Color(0xFF96D8CC)),
                ), 
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        
        ],
      ),
    );
  }
}
