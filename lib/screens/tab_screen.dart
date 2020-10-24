import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/screens/favorite.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourities',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategortScreen(),
            //Favorite()
          ],
        ),
      ),
    );
  }
}
