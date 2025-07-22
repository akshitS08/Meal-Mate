import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_mate/data/dummy_data.dart';

final mealsProvider = Provider((ref){
  return dummyMeals;
});