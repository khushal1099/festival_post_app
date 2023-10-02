import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'festivalclass.dart';

Festival fest= Festival();

List <Map> post=[
  {
    "Name":"",
    "Des":"",
  },
];
List<String> img = [
  "images/b1.jpg",
  "images/b2.jpg",
  "images/b3.jpg",
  "images/b4.jfif",
  "images/b5.jpg",
  "images/b6.jpg",
];
List<Color> colors = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.cyan,
  Colors.brown,
  Colors.orange
];
List<TextStyle> fonts = [
  GoogleFonts.lato(),
  GoogleFonts.dancingScript(),
  GoogleFonts.freehand(),
  GoogleFonts.megrim(),
  GoogleFonts.moul(),
];

List<Uint8List> postlist=[];
