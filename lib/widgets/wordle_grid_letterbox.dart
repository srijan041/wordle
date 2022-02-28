import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LetterBox extends StatelessWidget {
  const LetterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: const Center(
        child: Text(
          '',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
