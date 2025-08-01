import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget{
  MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(context){
    return Row(
      children: [
        Icon(icon, size: 17,
          color: Colors.white,),

        SizedBox(width: 6,),

        Text(label,
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}