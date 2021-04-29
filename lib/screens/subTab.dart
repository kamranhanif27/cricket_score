import 'package:flutter/material.dart';

class SubTab extends StatefulWidget {
  final ValueChanged<int> onChanged;
  SubTab({Key key, this.onChanged}) : super(key: key);

  @override
  _SubTabState createState() => _SubTabState();
}

class _SubTabState extends State<SubTab> {
  int subIndex = 0;
  ButtonStyle _selected = ElevatedButton.styleFrom(
    elevation: 0.0,
    primary: Colors.purple,
  );
  ButtonStyle _unSelected = ElevatedButton.styleFrom(
    elevation: 0.0,
    primary: Colors.grey.shade50,
    onPrimary: Colors.purple,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getButton('Batsman', 0),
        getButton('Bowler', 1),
        getButton('All-Rounder', 2),
        getButton('Teams', 3),
      ],
    );
  }

  Widget getButton(String txt, int i, ) {
    return ElevatedButton(
      style: subIndex == i ? _selected : _unSelected,
      onPressed: () {
        setState(() {
        subIndex = i;
        widget.onChanged(i);
        });
      },
      child: Text(txt),
    );
  }
}