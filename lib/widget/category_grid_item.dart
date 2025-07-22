import 'package:flutter/material.dart';
import 'package:meal_mate/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({super.key, required this.category,
    required this.onSelectedCategory});

  final Category category;
  final void Function() onSelectedCategory;

  @override
  Widget build(context) {
    return InkWell( // InkWell the widget which make the item tappable and also provide a good feedback when user taps the item
      onTap: onSelectedCategory,
      // onTap provide a function which is used when the item is taped
      splashColor: Theme.of(context).primaryColorLight, // splashColor is used to provide the visual effect on tapping
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
