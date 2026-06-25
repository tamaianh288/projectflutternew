import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState()) {
    on<ChangeColorEvent>(_onChangeColor);
  }

  Future<void> _onChangeColor(ChangeColorEvent event, Emitter<TestState> emit) async {
    bool isRed = !state.isRed;
    emit(state.copyWith(isRed: isRed));
  }

}
