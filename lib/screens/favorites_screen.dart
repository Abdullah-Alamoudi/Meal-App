import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritemeals;

   FavoriteScreen(this.favoritemeals);

  @override
  Widget build(BuildContext context) {
    if(favoritemeals.isEmpty){
        return Center(
    child: Text('Yoy have no Favorite yet- start add some!'),
   ); 
    }
    else{
      return ListView.builder(
        itemCount: favoritemeals.length,
        itemBuilder: (ctx,index){
          return MealItem(
            id:favoritemeals[index].id,
            title: favoritemeals[index].title,
            imageurl: favoritemeals[index].imageUrl,
            duration: favoritemeals[index].duration,
            complexity: favoritemeals[index].complexity,
            affordability: favoritemeals[index].affordability,
            
          );
        });
    }
   
  }
}