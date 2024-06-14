import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:job_dream/app/widgets/primary_button.dart'; // Pastikan path sesuai dengan struktur proyek Anda

class CheckEmailPage extends StatefulWidget {
  @override
  _CheckEmailPageState createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  TextEditingController _pinEditingController = TextEditingController(); // Add TextEditingController

  @override
  void dispose() {
    _pinEditingController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Check Your Email',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/email.png'),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'We just sent an OTP to your \n registered email Put here.',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveColor: Color(0xFF96D8CC),
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                controller: _pinEditingController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print(value);
                  // You can handle onChanged event here if needed
                },
                onCompleted: (value) {
                  print(value);
                  // You can handle onCompleted event here if needed
                },
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              'Verify Email',
              onPressed: () {
                // You can implement verification logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
