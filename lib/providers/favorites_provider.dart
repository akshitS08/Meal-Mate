import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
FavoriteMealsNotifier() : super([]); // by making this constructor function we created our initial data that will going to store in the StateNotifier class

bool toggleFavoriteMealsStatus(Meal meal){
 final mealIsFavorite = state.contains(meal);

 if(mealIsFavorite){
   state = state.where((m) => m.id != meal.id).toList();
   return false;
 }else{
   state = [...state, meal];
 return true;
 }
}

}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});