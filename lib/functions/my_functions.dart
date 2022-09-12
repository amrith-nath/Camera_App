import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

//*color

colorWhiteLight() {
  return const Color.fromRGBO(232, 237, 223, 1);
}

colorBlack() {
  return const Color.fromRGBO(36, 36, 35, 1);
}

colorBlackLight() {
  return const Color.fromRGBO(51, 53, 51, 1);
}

colorBlue() {
  return const Color.fromRGBO(109, 74, 254, 1);
}

colorPink() {
  return const Color.fromRGBO(246, 119, 186, 1);
}

colorYellow() {
  return const Color.fromRGBO(245, 203, 92, 1);
}
//padding

paddingFunction(width, height, {bottom = 0.0}) {
  return EdgeInsets.fromLTRB(
    0.05 * width,
    0.02 * height,
    0.05 * width,
    bottom,
  );
}

paddingFunctionNotop(width, height, {bottom = 0.0, top = 0.0}) {
  return EdgeInsets.fromLTRB(
    0.05 * width,
    top,
    0.05 * width,
    bottom,
  );
}

//*Text

headText(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )));
}

headTextWhite(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

headTextWhiteCenter(text, {Color: Colors.black}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

bodyText(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )));
}

bodyTextblue(text, {Color: Colors.black}) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: colorBlue(),
      )));
}

bodyTextGreenSmall(text) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade400,
      )));
}

bodyTextWhite(text) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

bodyTextWhitesmall(text) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      )));
}

bodyTextsmall(text) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      )));
}

bodyTextWhiteUnderline(text) {
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
        backgroundColor: Colors.amber,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

headTextCenter(text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontSize: 42, fontWeight: FontWeight.w600, color: Colors.white)));
}

headTextCenterBlack(text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontSize: 42, fontWeight: FontWeight.w600, color: Colors.black)));
}

sizedBoxHere(height) {
  return SizedBox(
    height: 0.03 * height,
  );
}
//*Bottom NAvigation

//*container style

decorateContainer({color}) {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 9.0,
      ),
    ],
    // borderRadius: BorderRadius.circular(20),
    // color: color,
  );
}

decorateContainerBlackShadow({color}) {
  return const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 59, 59, 59),
        blurRadius: 9.0,
      ),
    ],
    // borderRadius: BorderRadius.circular(20),
    // color: color,
  );
}

//*container shadow

shadowContainer() {
  return [
    const BoxShadow(
        color: Color.fromARGB(255, 125, 125, 125),
        blurRadius: 7,
        offset: Offset(0.0, 3.0))
  ];
}

//*input area

inputBox(controllarName, hinttext, {initValue}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Field is empty';
      }
      return null;
    },
    initialValue: initValue,
    controller: controllarName,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(),
        hintText: hinttext),
  );
}

inputBoxNum(controllarName, hinttext, {initValue}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Field is empty';
      }
      return null;
    },
    initialValue: initValue,
    keyboardType: TextInputType.number,
    controller: controllarName,
    decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(Icons.abc),
        border: OutlineInputBorder(),
        hintText: hinttext),
  );
}

textInfoRow(String text, String infoText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [bodyTextWhite('$text  '), bodyTextWhite(infoText)],
  );
}

textInfoRowBlack(String text, String infoText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [bodyText('$text  '), bodyTextWhite(infoText)],
  );
}
