// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element, override_on_non_overriding_member, must_call_super

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:province_thailand_project/views/HomeUI.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState(){
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.11,
              backgroundImage: AssetImage(
                'assets/images/provinceIcon.jpg'
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'จังหวัดสระแก้ว',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sa Kaeo Province',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Text(
              'Copyright 2024 © Power by Prasit K.',
              style: GoogleFonts.kanit(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
