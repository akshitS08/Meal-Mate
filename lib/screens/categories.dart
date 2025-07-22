import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_mate/data/dummy_data.dart';
import 'package:meal_mate/screens/meals.dart';
import 'package:meal_mate/widget/category_grid_item.dart';
import 'package:meal_mate/models/category.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatefulWidget{
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {

  // We gonna apply Explicit Animations in this Category Screen
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward(); // it starts the animation to the stop state.
    // basically this vsync is responsible for make sure this animation executes for every frame which is 60 times per second, to overall provide a smooth animation.
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }// this helps in removing the memory overflows. When this widget is removed then this animation also removed.

  void _selectCategory(context, category){
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
        MealsScreen(
            title: category.title,
            meals: filteredMeals,
        ),),);
    // alternative of Navigator.push(context, route);
  }

  @override
  Widget build(context){
    return AnimatedBuilder(animation: _animationController,
      // we out this grid view in the child widget because whenever the animation calls the grid view don't need to rebuilt therefore we seperately manage this. And the performance of the app is also improved.
      child: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // it tells how many columns we need
            childAspectRatio: 3/2, // it is useful for managing the sizing in the GridView item
            crossAxisSpacing: 20, // it provides good space
            mainAxisSpacing: 20,
          ),
          children: [
            // for method is alternative of availableCategories.map((category)) => CategoryGridItem(category: category,).toList()
            for(final category in availableCategories)
              CategoryGridItem(category: category,
                onSelectedCategory: (){
                  _selectCategory(context, category);
                },
              ),
          ],
        ),
        builder: (context, child) => SlideTransition(position:
        Tween(
          begin: Offset(0, 0.3),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(parent: _animationController,
          curve: Curves.easeInOut,
        ),),
        // drive is the method that can used to translate this animation between the lower and upper bound values
          // Tween class creates tween objects that clearly used in animating the transition between two values
          // and now we can do animation between two offsets because the position wants animation over offsets values.
          child: child,),
          //   Padding(
          // padding: EdgeInsets.only(top: 100 -  _animationController.value * 100),
          // child: child,),
    );
  }
}