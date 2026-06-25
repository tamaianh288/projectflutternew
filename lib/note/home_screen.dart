import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectflutternew/note/note_screen.dart';
import 'package:projectflutternew/string_utils.dart';
import 'custom_widgets.dart';
import 'dart:math';
import 'note.dart';
import 'MediaUtils.dart';

import 'bloc_note/note_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Color _getRandomColor(List<Note> notes) {
    if (notes.isEmpty) {
      return ItemColors.noteColors[Random().nextInt(ItemColors.noteColors.length)];
    }
    Color firstColor = notes.first.color;
    Color newColor;
    do {
      newColor = ItemColors.noteColors[Random().nextInt(ItemColors.noteColors.length)];
    } while (newColor == firstColor);
    return newColor;
  }

  @override
  Widget build(BuildContext context) {
    print("build1");
    return BlocProvider(
      create: (context) => NoteBloc()..add(LoadNotesEvent()),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          print("build2");
          return Scaffold(
            backgroundColor: const Color(0xFF252525),
            appBar: _appBar(context, state),
            body: state.isSearching
                ? _buildSearchList(context, state)
                : (state.notes.isEmpty ? _buildEmptyState() : _buildNotesList(context, state)),
            floatingActionButton: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                onPressed: () => _nagigateToNoteScreen(context, state),
                backgroundColor: const Color(0xFF252525),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                elevation: 6,
                child: const Icon(Icons.add, color: Colors.white, size: 60),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context, NoteState state) {
    return AppBar(
      centerTitle: false,
      toolbarHeight: state.isSearching ? 90 : 50,
      backgroundColor: const Color(0xFF252525),
      title: state.isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              onChanged: (value) {
                // Gửi event search
                context.read<NoteBloc>().add(SearchNotesEvent(value));
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: StringUtils.search_key,
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF3B3B3B),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    if (_searchController.text.isEmpty) {
                      context.read<NoteBloc>().add(ToggleSearchEvent(false));
                    } else {
                      _searchController.clear();
                      context.read<NoteBloc>().add(SearchNotesEvent(''));
                    }
                  },
                ),
              ),
            )
          : Text(
        StringUtils.notes,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 52),
      ),
      actions: state.isSearching
          ? []
          : [
        CustomInkWell(
          icon: Icons.search,
          onTap: () {
            context.read<NoteBloc>().add(ToggleSearchEvent(true));
          },
        ),
        const SizedBox(width: 25),
        CustomInkWell(icon: Icons.info_outline, onTap: () {}),
        const SizedBox(width: 20),
      ],
    );
  }

  void _nagigateToNoteScreen(BuildContext context, NoteState state, {Note? existingNote, int? idx}) {
    Color noteColor = existingNote?.color ?? _getRandomColor(state.notes);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(noteColor: noteColor, note: existingNote)),
    ).then((newNote) {
      if (newNote != null) {
        context.read<NoteBloc>().add(SaveNoteEvent(newNote, index: idx));
      }
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(MediaUtils.note_img),
          CustomText(text: StringUtils.first_note, color: Colors.white, fontSize: 20),
        ],
      ),
    );
  }

  Widget _buildSearchList(BuildContext context, NoteState state) {
    print("build3");
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: state.filteredNotes.length,
      itemBuilder: (context, index) {
        final note = state.filteredNotes[index];
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: note.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(note.title, style: const TextStyle(fontSize: 24, color: Colors.black)),
        );
      },
    );
  }

  Widget _buildNotesList(BuildContext context, NoteState state) {
    print("build4");
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: state.notes.length,
      itemBuilder: (ctx, index) {
        final note = state.notes[index];

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
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  backgroundColor: const Color(0xFF252525),
                  contentPadding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  content: SizedBox(
                    width: 200,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info, color: Colors.grey[600]),
                        const SizedBox(height: 30),
                        CustomText(text: StringUtils.save_option, color: Colors.white, fontSize: 24),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SaveInkWell(
                                bgColor: Colors.grey,
                                text: StringUtils.cancel,
                                onTap: () => Navigator.of(dialogContext).pop(false)),
                            const SizedBox(width: 30),
                            SaveInkWell(
                                bgColor: Colors.red,
                                text: StringUtils.delete,
                                onTap: () => Navigator.of(dialogContext).pop(true)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          onDismissed: (direction) {
            context.read<NoteBloc>().add(DeleteNoteEvent(index));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomText(text: StringUtils.deleted, color: Colors.white, fontSize: 20),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: InkWell(
            onTap: () {
              _nagigateToNoteScreen(context, state, existingNote: note, idx: index);
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: note.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(note.title, style: const TextStyle(fontSize: 24, color: Colors.black)),
            ),
          ),
        );
      },
    );
  }
}