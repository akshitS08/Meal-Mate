import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_mate/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
FiltersScreen({super.key});

// final Map<Filter, bool> currentFilters; // this property states used to focus on when the user apply filters to the meals then the filters won't back to OFF.

// @override
//   ConsumerState<FiltersScreen> createState(){
//   return _FiltersScreenState();
// }
// }
//
// class _FiltersScreenState extends ConsumerState<FiltersScreen>{
//   var _glutenFreeFilterSet = false; // the value of switch is currently off
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeFilters = ref.read(filterProvider);
  //
  //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  //   _veganFilterSet = activeFilters[Filter.vegan]!;
  // }

  @override
  Widget build(context, WidgetRef ref){
    final activerFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen(),
      //     ),
      //     );
      //   }
      // }),
      // WillPopScope(
      //   onWillPop: () async {
      //     ref.read(filterProvider.notifier).setFilters({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegetarian: _vegetarianFilterSet,
      //       Filter.vegan: _veganFilterSet,
      //     });
      //     // Navigator.of(context).pop();
      //     return true;
      //   },
      body:
      Column(
          children: [
            // SwitchListTile is the widget which used to add switch with text or subtexts
            SwitchListTile(
              value: activerFilters[Filter.glutenFree]!,
              onChanged: (isChecked){
                // onChanged is trigger when the user toggle the switch and isChecked is the new value of the switch whether it is true or false
              // setState(() {
              //   _glutenFreeFilterSet = isChecked;
              // });
                ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
            title: Text('Gluten-Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
              subtitle: Text('Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary, // it used to show the color when the switch on and off
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: activerFilters[Filter.lactoseFree]!, // value is the current state of the switch which is basically false due to upward variable formation
              onChanged: (isChecked){
                // onChanged is trigger when the user toggle the switch and isChecked is the new value of the switch whether it is true or false
                // setState(() {
                //   _lactoseFreeFilterSet = isChecked;
                // });
                ref.watch(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text('Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              subtitle: Text('Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary, // it used to show the color when the switch on and off
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
                value: activerFilters[Filter.vegetarian]!,
              onChanged: (isChecked){
                  ref.watch(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text('Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              subtitle: Text('Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
                value: activerFilters[Filter.vegan]!,
                onChanged: (isChecked){
                  ref.watch(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
                },
            title: Text('Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
              subtitle: Text('Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
  }
}