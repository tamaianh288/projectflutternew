part of 'note_bloc.dart';

abstract class NoteEvent {}

class LoadNotesEvent extends NoteEvent {}

class SaveNoteEvent extends NoteEvent {
  final Note note;
  final int? index;
  SaveNoteEvent(this.note, {this.index});
}

class DeleteNoteEvent extends NoteEvent {
  final int index;
  DeleteNoteEvent(this.index);
}

class SearchNotesEvent extends NoteEvent {
  final String query;
  SearchNotesEvent(this.query);
}

class ToggleSearchEvent extends NoteEvent {
  final bool isSearching;
  ToggleSearchEvent(this.isSearching);
}