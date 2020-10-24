import 'package:flutter/material.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteMeals;

  Favorite(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return Center(child: Container(child: Text('No favorities yes '),));
    }
    else{
      return ListView.builder(itemBuilder:(context,index){
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
        );
      },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
