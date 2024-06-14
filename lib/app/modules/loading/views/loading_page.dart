import 'package:flutter/material.dart';
import 'package:job_dream/app/widgets/primary_button.dart';
import 'package:job_dream/app/modules/auth/login/views/login_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 440,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF96D8CC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.0),
              ),
            ),
          ),
          Container(
            height: 500,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: ClipPath(
              clipper: BezierClipper(),
              child: Container(
                color: const Color(0xFF38A692),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 500,
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      'assets/img/humanz.png',
                      width: 150,
                      height: 500,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Upgrade Your Skill\nFind your Dream\nJob Here',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We provide many types of jobs\nfrom various cities around the world',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton("Get Started", onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height); // Starting point at bottom-left corner
    path.lineTo(0, size.height - 150); // Line to the control point
    path.quadraticBezierTo(0, size.height - 70, 200,
        size.height - 200); // Bezier curve to the bottom-right corner
    path.quadraticBezierTo(300, size.height - 250, 400,
        size.height - 200); // Bezier curve to the bottom-right corner
    path.quadraticBezierTo(800, size.height, size.width,
        size.height); // Bezier curve to the bottom-right corner
    path.lineTo(size.width, 0); // Line to the top-right corner
    path.lineTo(0, 0); // Line back to the top-left corner
    path.close(); // Close the path
    // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
