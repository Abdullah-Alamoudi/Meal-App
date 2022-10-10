import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem( this.id, this.title, this.color);

  void selectGategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
    arguments: {
      'id':id,
      'title':title
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectGategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,
        style: Theme.of(context).textTheme.headline4,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}