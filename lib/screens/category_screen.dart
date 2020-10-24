import 'package:flutter/material.dart';
import 'package:mealapp/database/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';

class CategortScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((data){
          return CategoryItem(
              data.id,
              data.title,
              data.color
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),
      ),
    );
  }
}
