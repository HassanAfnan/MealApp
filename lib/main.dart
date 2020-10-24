import 'package:flutter/material.dart';
import 'package:mealapp/database/dummy_data.dart';
import 'package:mealapp/screens/bottom_navigation_bar.dart';
import 'package:mealapp/screens/category_meals.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/screens/filter.dart';
import 'package:mealapp/screens/meal_detail.dart';
import 'package:mealapp/screens/tab_screen.dart';

import 'models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutin': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData){
    setState(() {
      filters = filterData;
    });
    availableMeals = DUMMY_MEALS.where((meals){
       if(filters['gluten'] && !meals.isGlutenFree){
         return false;
       }
       if(filters['lactose'] && !meals.isLactoseFree){
         return false;
       }
       if(filters['vegan'] && !meals.isVegan){
         return false;
       }
       if(filters['vegetarian'] && !meals.isVegetarian){
         return false;
       }
       return true;

    }).toList();
  }

  void toggleFavorite(String mealId){
    final existingIndex = favoriteMeals.indexWhere((element) => element.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id){
    return favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealOO',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold)
          ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomTabScreen(favoriteMeals),
        CategoryMeal.routeName: (context) => CategoryMeal(availableMeals),
        MealDetail.routeName: (context) => MealDetail(toggleFavorite,isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen(setFilters,filters)
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context) => CategortScreen());
      // },
      onUnknownRoute: (settings){ // show the error page
        return MaterialPageRoute(builder: (context) => CategortScreen());
      },
    );
  }
}
