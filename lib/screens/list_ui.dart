import 'package:flutter/material.dart';

class ListUI extends StatelessWidget {

  final bool isRating;
  final int rank;
  final String name;
  final int points;
  final int rating;
  final Color color;

  const ListUI({Key key, this.isRating, this.rank, this.name, this.points, this.rating, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text('$rank')
          ),
          Expanded(
          flex: 3,
          child: Text(
              '${name.replaceAll(new RegExp(r"\ "), "")}',
              textAlign: TextAlign.left,
            ),
          ),
          if (isRating == true) Expanded(
            flex: 1,
            child: Text('$rating')
            ),
          SizedBox(width:15.0),
          Expanded(child: Text('$points')),
        ],
      ),
    );
  }
}