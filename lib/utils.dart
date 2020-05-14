///
/// App Name: QNote
/// Authors: Stefany Carrillo & Cristian Ayub
/// Instructor: Dr. Yonsiik Cheon
/// Course: CS 4320/5318
///

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Adds text to the screen of the BottomNavigationBar tab
Text setMainTabText(String heading) {
  return Text(
    heading,
    style: GoogleFonts.fredokaOne(
      textStyle: TextStyle(fontSize: 30)
    ),
    textAlign: TextAlign.center
  );
}

/// Adds text to the title of the appbar
Text setAppTitle(String title) {
  return Text(
    title,
    style: GoogleFonts.fredokaOne(
      textStyle: TextStyle(fontSize: 25)
    )
  );
}

/// Adds text to the headings in the profile page
Text setProfileHeadingText(String heading) {
  return Text(
    heading,
    style: GoogleFonts.fredokaOne(
      textStyle: TextStyle(fontSize: 20)
    )
  );
}

/// Adds text to the buttons
Text setButtonText(String value) {
  return Text(
    value,
    style: GoogleFonts.fredokaOne(
      textStyle: TextStyle(fontSize: 15),
      color: Colors.white,
    )
  );
}