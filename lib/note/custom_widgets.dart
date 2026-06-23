import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget{
  final IconData? icon;
  final VoidCallback onTap;

  const CustomInkWell ({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        onTap: onTap,
        // splashColor: Colors.grey[500],
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Icon(icon, color: Colors.white,),
        ),
      ),
    );
  }
}

class SaveInkWell extends StatelessWidget{
  final Color bgColor;
  final String text;
  final VoidCallback onTap;

  const SaveInkWell ({super.key, required this.bgColor, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        onTap: onTap,
        // splashColor: Colors.grey[500],
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget{
  final double? size;
  final String? hintText;
  final TextEditingController? controller;

  const CustomTextField({super.key, required this.size, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null, //tự động xuống dòng, không giới hạn số dòng
      // keyboardType: TextInputType.multiline,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF9A9A9A),
          fontSize: size,
        ),
        border: InputBorder.none,
      ),
      cursorColor: Colors.white,
    );
  }
}

class CustomText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? fontSize;

  const CustomText({super.key, required this.text, required this.color, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text ,style: TextStyle(color: color, fontSize: fontSize),);
  }
}

class ItemColors {
    static const List<Color> noteColors = [
      const Color(0xFFFD99FF),
      const Color(0xFFFF9E9E),
      const Color(0xFF91F48F),
      const Color(0xFFFFF599),
      const Color(0xFF9EFFFF),
      const Color(0xFFB69CFF),
    ];
}
