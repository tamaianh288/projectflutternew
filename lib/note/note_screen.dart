import 'package:flutter/material.dart';
import 'package:projectflutternew/string_utils.dart';
import 'home_screen.dart';
import 'custom_widgets.dart';

class NoteScreen extends StatelessWidget{
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
        appBar: AppBar(
          backgroundColor: Color(0xFF252525),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 3.0, bottom: 3.0),
            child: CustomInkWell(icon: Icons.arrow_back_ios_new, onTap: (){},),),
          actions: [
            CustomInkWell(icon: Icons.remove_red_eye_outlined, onTap: () {},),
            SizedBox(width: 25,),
            CustomInkWell(icon: Icons.save_outlined, onTap: () { _showSaveDialog(context);},),
            SizedBox(width: 20,),
          ],
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(size: 52, hintText: StringUtils.title),
                SizedBox(height: 20,),
                CustomTextField(size: 24, hintText: StringUtils.content),
              ],
            ),
        ),
      )
    );
  }

  void _showSaveDialog(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Color(0xFF252525),
        contentPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info, color: Colors.grey[600],),
              SizedBox(height: 30,),
              CustomText(text: StringUtils.save_option, color: Colors.white, fontSize: 24),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SaveInkWell(bgColor: Colors.red, text: StringUtils.discard, onTap: (){}),
                  SizedBox(width: 30,),
                  SaveInkWell(bgColor: Colors.green, text: StringUtils.save, onTap: (){}),
                ],
              ),
            ],
          ),
        )
      );
    });
  }
}
