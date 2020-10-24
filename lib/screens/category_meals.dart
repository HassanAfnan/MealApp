import 'package:flutter/material.dart';
import 'package:mealapp/database/dummy_data.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {

  static const routeName = 'categories-meals';

  final List<Meal> availableMeals;

  CategoryMeal(this.availableMeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {

  String categoryTitle;
  List<Meal> displayedMeals;
  bool loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

   // we dont use initstate due to context
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // if(loadedInitData ) {
    //   final routeArgs = ModalRoute
    //       .of(context)
    //       .settings
    //       .arguments as Map<String, String>;
    //   categoryTitle = routeArgs['title'];
    //   final categoryId = routeArgs['id'];
    //   displayedMeals = DUMMY_MEALS.where((element) {
    //     return element.categories.contains(categoryId);
    //   }).toList();
    //   loadedInitData = true;
    // }
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    loadedInitData = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: ListView.builder(itemBuilder:(context,index){
         return MealItem(
           id: displayedMeals[index].id,
           title: displayedMeals[index].title,
           imageUrl: displayedMeals[index].imageUrl,
           duration: displayedMeals[index].duration,
           complexity: displayedMeals[index].complexity,
           affordability: displayedMeals[index].affordability,
           removeItem: _removeMeal,
         );
      },
       itemCount: displayedMeals.length,
      ),
    );
  }
}
