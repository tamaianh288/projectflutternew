import 'package:flutter/material.dart';
import 'package:projectflutternew/string_utils.dart';
import 'home_screen.dart';
import 'custom_widgets.dart';
import 'dart:math';

class NoteScreen extends StatelessWidget{
  final Color noteColor;
  final Note? note;
  NoteScreen({super.key, required this.noteColor, this.note});

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(note != null){
      titleController.text = note!.title;
      contentController.text = note!.content;
    }
    return Scaffold(
      backgroundColor: Color(0xFF252525),
        appBar: AppBar(
          backgroundColor: Color(0xFF252525),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 3.0, bottom: 3.0),
            child: CustomInkWell(icon: Icons.arrow_back_ios_new, onTap: (){ Navigator.pop(context); },),),
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
                CustomTextField(size: 35, hintText: StringUtils.title, controller: titleController,),
                SizedBox(height: 20,),
                CustomTextField(size: 24, hintText: StringUtils.content, controller: contentController,),
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
                  SaveInkWell(bgColor: Colors.red, text: StringUtils.discard, onTap: (){ Navigator.pop(context);}),
                  SizedBox(width: 30,),
                  SaveInkWell(bgColor: Colors.green, text: StringUtils.save, onTap: (){
                    String title = titleController.text.trim();
                    String content = contentController.text.trim();

                    String newId;
                    if (note != null){
                      newId = note!.id;
                    }else{newId = DateTime.now().toString();}

                    if(title.isNotEmpty && content.isNotEmpty){
                      // Nếu sửa thì giữ nguyên id cũ. Nếu là tạo mới thì cấp id mới.
                      Note newNote = Note(id: newId, title: title, content: content, color: noteColor);

                      //Đóng Dialog
                      Navigator.pop(context);

                      // Đóng NoteScreen và gửi data về HomeScreen
                      Navigator.pop(context, newNote);
                    }
                  }),
                ],
              ),
            ],
          ),
        )
      );
    });
  }
}
