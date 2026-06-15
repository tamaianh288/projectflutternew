import 'package:flutter/material.dart';

class ListMessageScreen extends StatelessWidget{
  const ListMessageScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrungLee'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Image.asset('assets/images/Heart.png'),
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/MoreCircle.png')
          ),
        ],
      ),
      body: Center(),
    );
  }
}