import 'package:flutter/material.dart';
import 'package:mealapp/database/dummy_data.dart';

class MealDetail extends StatelessWidget {

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetail(this.toggleFavorite,this.isMealFavorite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context,String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      height: 270,
      width: 300,
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final meakId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) =>  element.id == meakId);
    return Scaffold(
      appBar: AppBar(
        title: Text('$meakId'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
                itemBuilder: (context,index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,),),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context,index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
              itemCount: selectedMeal.steps.length,),),
            SizedBox(height: 20,)
          ],),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isMealFavorite(meakId) ? Icons.favorite : Icons.favorite_border
          ),
         onPressed: () => toggleFavorite(meakId),
      ),
    );
  }
}
