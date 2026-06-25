import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectflutternew/note/bloc_test/test_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _container(),
              SizedBox(
                height: 16,
              ),
              _button()
            ],
          ),
        ),
      ),
    );
  }

  Widget _container() {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        print("MaiAnh1");
        return Container(
          height: 80,
          width: 80,
          color: state.isRed ? Colors.red : Colors.black,
        );
      },
    );
  }

  Widget _button() {
    return Builder(
      builder: (context) {
        print("MaiAnh2");
        return InkWell(
          onTap: () {
            context.read<TestBloc>().add(ChangeColorEvent());
          },
          child: Container(
            height: 80,
            width: 160,
            color: Colors.cyanAccent,
            child: Center(
              child: Text(
                  "Click"
              ),
            ),
          ),
        );
      }
    );
  }
}

