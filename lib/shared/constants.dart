import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
);

const kLoginScreenTextInputDecoration = InputDecoration(
  fillColor: Color(0xfff4f5f4),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none),
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        (Radius.circular(30)),
      ),
      borderSide: BorderSide.none),
  // border: InputBorder.none
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none),
);

const kAddingTodoInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
  fillColor: Colors.transparent,
  errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
  filled: true,
  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
  // border: InputBorder.none
  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
);

const greyGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 0.45, 1],
    colors: [Color(0xffdcdfe0), Color(0xffebedee), Color(0xffe4e7e8)]);

const trackerAdderTextInputDecoration = InputDecoration(
  //fillColor: Color(0xff979ca1),
  //fillColor: Color(0xffebedee),
  fillColor: Colors.transparent,
  filled: true,
  hintStyle: TextStyle(color: Colors.black),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
);

const kRedGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.45,
      1
    ],
    colors: [
      Color(0xff93291E),
      Color(0xffED213A),
    ]);

const kMorningGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.5, 1],
    colors: [Color(0xffFF5F6D), Color(0xffFFC371)]);

const kEveningGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.5,
      1
    ],
    colors: [
      Color(0xff1e3c72),
      Color(0xff2a5298),
    ]);

const kIbizaSunset = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.5,
      1
    ],
    colors: [
      Color(0xffee0979),
      Color(0xffff6a00),
    ]);

const kGradientBlueRasperry = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.45,
      1
    ],
    colors: [
      Color(0xff00B4DB),
      Color(0xff0083B0),
    ]);

const kAppIndigo = Color(0xff3938d5);

const kTextFormFieldStyle = TextStyle(color: Colors.black);

// * Home Screen Constant
const String kWelcomeHeading = "Hello,\n";
const TextStyle kWelcomeHeadingStyle =
    TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold);
const String kAppBarTitle = "Dashboard";
