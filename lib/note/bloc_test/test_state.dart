part of 'test_bloc.dart';

class TestState {
  bool isRed;

  TestState({
    this.isRed = false
  });

  TestState copyWith({
    bool? isRed,
  }) {
    return TestState(
      isRed: isRed ?? this.isRed
    );
  }
}
