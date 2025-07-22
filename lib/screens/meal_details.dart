import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);
    
    return Scaffold(
      appBar: AppBar(title: Text(meal.title,),
        actions: [ // we are using actions for make the icon and mark a meal as a favourite.
          IconButton(onPressed: (){
           final wasAdded =  ref.read(favoriteMealsProvider.notifier).toggleFavoriteMealsStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                content: Text(wasAdded ? 'Meal added as a Favorite' : 'Meal removed.')));
          },
            icon:
            AnimatedSwitcher(
              // this the Implicit Animation style which uses the pre-built animation by the flutter.
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation){
                return RotationTransition(turns: Tween<double>(
                  begin: 0.8,
                  end: 1,
                ).animate(animation),
                  child: child,);
              },
              child: Icon(isFavorite ?  Icons.star : Icons.star_border,
              key: ValueKey(isFavorite),
                // this Key basically help to told the icon that something is changed and you need to apply the animation on the icon.
              ),
            ),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 14,),

            Text('Ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: 14,),

            for(final ingredients in meal.ingredients)
              Text(ingredients,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            SizedBox(height: 20,),

            Text('Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 14,),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,
                horizontal: 12),
                child: Text(step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              )
          ],
        ),
      ),
    );
  }
}
