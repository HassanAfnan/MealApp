import 'package:flutter/material.dart';
import 'package:mealapp/screens/filter.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text("Cooking Up",
              style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            onTap: (){
              Navigator.pop(context);
            },
            leading: Icon(Icons.restaurant,
            size: 26,),
            title: Text("Meals",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
            leading: Icon(Icons.filter,
              size: 26,),
            title: Text("Filters",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
