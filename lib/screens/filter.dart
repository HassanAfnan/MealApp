import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarianFree = false;
  bool veganFree = false;
  bool lactoseFree = false;

  Widget buildSwitchTile(String title,String description, bool value,Function updateVal){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: updateVal,
    );
  }

   @override
  void initState() {
    // TODO: implement initState
     glutenFree = widget.currentFilters['gluten'];
     lactoseFree = widget.currentFilters['lactose'];
     vegetarianFree = widget.currentFilters['vegetarian'];
     veganFree = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters"
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': veganFree,
                'vegetarian': vegetarianFree
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection.",
            style: Theme.of(context).textTheme.title)
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile('Glutin Free', 'No Glutin', glutenFree, (val){setState(() {
                  glutenFree = val;
                });}),
                buildSwitchTile('Vagetarian Free', 'No Vegetables', vegetarianFree, (val){setState(() {
                  vegetarianFree = val;
                });}),
                buildSwitchTile('Vegen Free', 'No Vegen', veganFree, (val){setState(() {
                  veganFree = val;
                });}),
                buildSwitchTile('Lactose Free', 'No Suger', lactoseFree, (val){setState(() {
                  lactoseFree = val;
                });}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
