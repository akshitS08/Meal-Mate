import 'package:flutter/material.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(context){
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      // this clipBehavior helps to use the shape we changed above because the stack just ignore it
      child: InkWell(
        onTap: (){
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, // the image can took its space while maintaining the aspect ratio
                height: 200,
                width: double.infinity,
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0, // these three make sure that the widget will lie on the top of the previous widget
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 5,
              horizontal: 44),
              child: Column(
                children: [
                  Text(meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis, // very long text....
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     MealItemTrait(icon: Icons.schedule,
                         label: '${meal.duration} min'),
                      SizedBox(width: 12,),
                      MealItemTrait(icon: Icons.work,
                          label: complexityText),
                      SizedBox(width: 12,),
                      MealItemTrait(icon: Icons.attach_money,
                          label: affordabilityText),
                    ],
                  ),
                ],
              ),
            ),),
          ],
        ), // this stack widget is used to overlap the widget each-other
      ),
    );
  }
}