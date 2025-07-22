import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_mate/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
        // now my filter state is initialised
      });

  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }

  // now we going to add a method which use to manipulate the filter state
  void setFilter(Filter filter, bool isActive) {
    // isActive define whether this filter values is now set to true or false
    // state[filter] = isActive; // but this is mutating the state and it is not allowed
    state = {
      ...state, // we copy the existing map value pair filters to update the newly map
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((meal){
    if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if(activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});