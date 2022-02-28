import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordle/widgets/wordle_grid_letterbox.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);
  final int rows = 6;
  final int wordLength = 5;

  Row getEachRow() {
    Row row;
    List<Widget> eachRowList = [];
    for (int i = 0; i < wordLength; i++) {
      eachRowList.add(LetterBox());
    }
    return Row(
      children: eachRowList,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Column returnGrid() {
    List<Row> entireGrid = [];
    for (int i = 0; i < rows; i++) {
      entireGrid.add(getEachRow());
    }

    return Column(
      children: entireGrid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return returnGrid();
  }
}
