import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isMealFavorite;

   MealDetailScreen({Key key, this.toggleFavorite, this.isMealFavorite}) : super(key: key);

  Widget buildSectionTitle(String text,BuildContext ctx){
    return Container
      (
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.title,
        ));
  }
  Widget buildContainer(Widget child){
   return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.lightGreen,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
      child: child,
   );

  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Container(
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              height: 300,
              width: double.infinity),
          buildSectionTitle('Ingredients',context),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                elevation: 8,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index],)),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),

          buildSectionTitle('Steps', context),
          buildContainer(ListView.builder(
            itemBuilder: (ctx,index){
              return Column(children:<Widget>[ListTile(
                leading: CircleAvatar(
                child: Text('#${(index+1)}'),
              ),
              title: Text(selectedMeal.steps[index]),
              ),
              Divider(),
              ]
              );
            },
            itemCount: selectedMeal.steps.length,),
          ),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealId)?Icons.star:Icons.star_border,),
      onPressed:(){toggleFavorite(mealId);}),
    );
  }
}
