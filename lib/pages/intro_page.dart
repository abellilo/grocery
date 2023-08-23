import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
              padding: const EdgeInsets.only(
                  left: 80, right: 80, top: 100, bottom: 40),
              child: Image.asset("lib/images/avocado.png")),
          //we deliver groceries to your door step
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "We delivery groceries at your door step",
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          //frest item everyday
          Text(
            "Fresh items everyday",
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          //get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage())),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
