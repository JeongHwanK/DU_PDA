import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  final String title;
  const CheckItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('재고 확인'),
      ),
      body: Text('재고 확인'),
    );
  }
}
