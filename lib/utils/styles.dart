import 'package:flutter/material.dart';

TextStyle textSubTitle(Color color) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textTitle(Color color) {
  return TextStyle(
    fontSize: 16,
    color: color,
    fontWeight: FontWeight.w500,
  );
}

TextStyle textHead(Color color) {
  return TextStyle(
    fontSize: 20,
    color: color,
    fontWeight: FontWeight.w700,
  );
}

Color darkBlue = const Color.fromRGBO(0, 0, 60, 0.9); //Hex #000646
Color blueGrey = Colors.blueGrey.shade400;
Color blueGreyDark = Colors.blueGrey.shade700;
Color greyLight = Colors.grey.shade300;
Color white = Colors.white;
Color red = Colors.redAccent.shade200;
Color green = Colors.greenAccent.shade400;

EdgeInsets marginLogin = const EdgeInsets.only(left: 10.0, right: 10.0);
EdgeInsets marginVertical = const EdgeInsets.only(left: 10.0, right: 30.0);
EdgeInsets marginHorizontal = const EdgeInsets.only(top: 10, bottom: 10);

BoxDecoration boxGrey = BoxDecoration(
    shape: BoxShape.rectangle,
    color: Colors.grey.shade50,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        offset: const Offset(10, 10),
        blurRadius: 10,
        //spreadRadius: 5,
      ),
      BoxShadow(
        color: Colors.grey.shade200,
        offset: const Offset(-10, -10),
        blurRadius: 10,
        //spreadRadius: 5,
      ),
    ]);

BoxDecoration boxLight = BoxDecoration(
    shape: BoxShape.rectangle,
    color: Colors.grey.shade50,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        offset: const Offset(10, 10),
        blurRadius: 10,
        //spreadRadius: 5,
      ),
    ]);
