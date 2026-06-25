part of 'note_bloc.dart';

class NoteState {
  final List<Note> notes;
  final List<Note> filteredNotes;
  final bool isSearching;

  NoteState({
    required this.notes,
    required this.filteredNotes,
    required this.isSearching,
  });

  NoteState copyWith({
    List<Note>? notes,
    List<Note>? filteredNotes,
    bool? isSearching,
  }){
    return NoteState(
      notes: notes ?? this.notes,
      filteredNotes: filteredNotes ?? this.filteredNotes,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}