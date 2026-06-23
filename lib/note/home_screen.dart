import 'package:flutter/material.dart';
import 'package:projectflutternew/note/note_screen.dart';
import 'package:projectflutternew/note/search_screen.dart';
import 'package:projectflutternew/string_utils.dart';
import 'custom_widgets.dart';
import 'dart:math';

class Note{
  String id;
  String title;
  String content;
  Color color;

  Note ({required this.id, required this.title, required this.content, required this.color});
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  List<Note> _notes = [];

  String _searchKey = "";

  Color _getRandomColor(){
    if (_notes.isEmpty) {
      return ItemColors.noteColors[Random().nextInt(ItemColors.noteColors.length)];
    }

    Color lastColor = _notes.last.color;
    Color newColor;

    do {
      newColor = ItemColors.noteColors[Random().nextInt(ItemColors.noteColors.length)];
    } while (newColor == lastColor);

    return newColor;
  }

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
          CustomInkWell(icon: Icons.search, onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(allNotes: _notes,),));},),
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
          onPressed: _nagigateToNoteScreen,
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

  void _nagigateToNoteScreen({Note? existingNote, int? idx}) async{
    Color noteColor = existingNote?.color ?? _getRandomColor();

    final Note? newNote = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoteScreen(noteColor: noteColor, note: existingNote,) ));

    if(newNote != null){
      setState(() {
        if(existingNote != null && idx != null){
          _notes[idx] = newNote;
        }
        else{_notes.insert(0, newNote);}
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
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _notes.length,
      itemBuilder: (context, index){
        final note = _notes[index];

        //Vẽ giao diện cho từng Note
        return Dismissible(
          key: Key(note.id),
          direction: DismissDirection.endToStart,

          background: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white, size: 32),
          ),
          confirmDismiss: (direction) async{
            return await showDialog(context: context, builder: (BuildContext context){
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
                      SaveInkWell(bgColor: Colors.grey, text: StringUtils.cancel, onTap: (){Navigator.of(context).pop(false);}),
                      SizedBox(width: 30,),
                      SaveInkWell(bgColor: Colors.red, text: StringUtils.delete, onTap: (){Navigator.of(context).pop(true);}),
                      ],
                    ),
                  ],
                ),
              ),
            );},);
          },
          onDismissed: (direction){
            setState(() {
              _notes.removeAt(index);
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomText(text: StringUtils.deleted, color: Colors.white, fontSize: 20),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: InkWell(
            onTap: () { _nagigateToNoteScreen(existingNote: note, idx: index);},
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: note.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(note.title, style: TextStyle(fontSize: 24, color: Colors.black),),
            ),
          ),
        );
      },
    );
  }
}


