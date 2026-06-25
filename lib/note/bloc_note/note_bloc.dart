import 'package:flutter_bloc/flutter_bloc.dart';
import '../note.dart';
import '../../string_utils.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState(notes: [], filteredNotes: [], isSearching: false)) {

    on<LoadNotesEvent>(_onLoad);

    on<ToggleSearchEvent>(_onToggleSearch);

    on<SearchNotesEvent>(_onSearch);

    on<SaveNoteEvent>(_onSave);

    on<DeleteNoteEvent>(_onDelete);
  }

  Future<void> _onLoad(LoadNotesEvent event, Emitter<NoteState> emit) async{
    emit(state.copyWith(notes: [], filteredNotes: [], isSearching: false));
  }

  Future<void> _onToggleSearch(ToggleSearchEvent event, Emitter<NoteState> emit) async{
    if (!event.isSearching) {
      emit(state.copyWith(isSearching: false, filteredNotes: []));
    } else {
      emit(state.copyWith(isSearching: true));
    }
  }

  Future<void> _onSearch(SearchNotesEvent event, Emitter<NoteState> emit) async{
    if (event.query.isEmpty) {
      emit(state.copyWith(filteredNotes: []));
    } else {
      String normalizedQuery = StringUtils.removeVietnameseTones(event.query).toLowerCase();

      List<Note> results = state.notes.where((note) {
        String normalizedTitle = StringUtils.removeVietnameseTones(note.title).toLowerCase();
        return normalizedTitle.contains(normalizedQuery);
      }).toList();

      emit(state.copyWith(filteredNotes: results));
    }
  }

  Future<void> _onSave(SaveNoteEvent event, Emitter<NoteState> emit) async{
    List<Note> updatedNotes = List.from(state.notes);
    if (event.index != null) {
      updatedNotes[event.index!] = event.note;
    } else {
      updatedNotes.insert(0, event.note);
    }
    emit(state.copyWith(notes: updatedNotes));
  }

  Future<void> _onDelete(DeleteNoteEvent event, Emitter<NoteState> emit) async{
    List<Note> updatedNotes = List.from(state.notes);
    updatedNotes.removeAt(event.index);
    emit(state.copyWith(notes: updatedNotes));  }
}