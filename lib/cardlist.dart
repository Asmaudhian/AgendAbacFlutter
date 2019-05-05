import 'package:flutter/material.dart';

class CardlistWidget extends StatelessWidget {
 final Color color;

 CardlistWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}