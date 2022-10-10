import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({Key key}) : super(key: key);
  static const routeName = 'meal_detail';
  final Function _toggleFavorite;
  final Function IsMealFavorite;

  const MealDetailScreen(this._toggleFavorite,this.IsMealFavorite);
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectmeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id.contains(mealid));
    return Scaffold(
      appBar: AppBar(
        title: Text(selectmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildTitle(context, 'ingredients'),
            BuildContaner(
              ListView.builder(
                  itemCount: selectmeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(ctx).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(selectmeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            BuildTitle(context, 'Steps'),
            BuildContaner(
              ListView.builder(
                  itemCount: selectmeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index+1}'),
                          ),
                          title: Text(selectmeal.steps[index]),
                        ),
                        Divider(color: Colors.black,),
                      ],
                    );
                  }),
            ),
            
          ],
        ),
      ),
    floatingActionButton:FloatingActionButton(
      child: Icon(
        IsMealFavorite(mealid)? Icons.star:Icons.star_border
      ),
      onPressed:()=>_toggleFavorite(mealid)
      //  (){Navigator.of(context).pop(mealid);}
     
    ) 
    );
  }

  Container BuildContaner(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 165,
        width: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: child);
  }

  Container BuildTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
