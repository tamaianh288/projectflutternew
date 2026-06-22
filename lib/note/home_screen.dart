import 'package:flutter/material.dart';
import 'package:projectflutternew/note/note_screen.dart';
import 'package:projectflutternew/string_utils.dart';
import 'custom_widgets.dart';

class Note{
  String id;
  String title;
  String contend;

  Note ({required this.id, required this.title, required this.contend});
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  List<Note> _notes = [];

  String _searchKey = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 50,
        // titleSpacing: 66,
        backgroundColor: Color(0xFF252525),
        title: Text(StringUtils.notes, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 52),),
        actions: [
          CustomInkWell(icon: Icons.search, onTap: () {},),
          SizedBox(width: 25,),
          CustomInkWell(icon: Icons.info_outline, onTap: () {},),
          SizedBox(width: 20,),
        ],
      ),
      body: _notes.isEmpty ? _buildEmptyState() : _buildNotesList(),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: _nagigateToAddNote,
          child: Icon(Icons.add, color: Colors.white, size: 60,),
          backgroundColor: Color(0xFF252525),
          shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          elevation: 6,
        ),
      ),
    );
  }

  void _nagigateToAddNote() async{
    final newNote = await Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen() ));

    if(newNote != null){
      setState(() {
        _notes.add(newNote);
      });
    }
  }

  Widget _buildEmptyState(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/note.png'),
          CustomText(text: StringUtils.first_note, color: Colors.white, fontSize: 20),
        ],
      ),
    );
  }

  Widget _buildNotesList(){
    return Center(

    );
  }
}


