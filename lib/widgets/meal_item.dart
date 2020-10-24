import 'package:flutter/material.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/screens/meal_detail.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    this.id,
    this.title,
    this.imageUrl,
    this.affordability,
    this.complexity,
    this.duration,
    this.removeItem
  });

  String get complexityText {
    if(complexity == Complexity.Simple){
      return 'Simple';
    }
    else if(complexity == Complexity.Challenging)
    {
      return 'Challenging';
    }
    else if(complexity == Complexity.Hard)
    {
      return 'Hard';
    }
    else{
      return 'Unknown';
    }
  }

  String get affordabilityText {
    if(affordability  == Affordability.Affordable){
      return 'Affordable';
    }
    else if(affordability == Affordability.Luxurious)
    {
      return 'Luxurious';
    }
    else if(affordability == Affordability.Pricey)
    {
      return 'Pricey';
    }
    else{
      return 'Unknown';
    }
  }

  void selectedMeal(BuildContext context) {
     Navigator.of(context).pushNamed(MealDetail.routeName,arguments: id).then((value){
        if(value != null){
          removeItem(value);
        }
     });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectedMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical:5 ,horizontal:20 ),
                        width:300,color: Colors.black54,child: Text(title,style: TextStyle(fontSize: 25,color: Colors.white),softWrap: true,overflow: TextOverflow.fade,)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 6,),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
