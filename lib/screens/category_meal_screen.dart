import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  //const CategoryMealScreen({Key key}) : super(key: key);
  static const routeName='categorymeal';
  final List<Meal> _availableMeals;

  const CategoryMealScreen(this._availableMeals);

  @override
  State<CategoryMealScreen> createState() => CategoryMealScreenState();
}

class CategoryMealScreenState extends State<CategoryMealScreen> {
  String categorytitle;
  List<Meal> categroymeal;
  void _removemeal(String meal_id){
      setState(() {
        categroymeal.removeWhere((item) {
          return item.id==meal_id;
          
      });
      });
    }
@override
void didChangeDependencies() // the same init to fast run app but also adet with context
{
  final routeArg=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryid=routeArg['id'];
    categorytitle=routeArg['title'];
    categroymeal=widget._availableMeals.where((meal){
        return meal.categories.contains(categoryid);
    }).toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemCount: categroymeal.length,
        itemBuilder: (ctx,index){
          return MealItem(
            id:categroymeal[index].id,
            title: categroymeal[index].title,
            imageurl: categroymeal[index].imageUrl,
            duration: categroymeal[index].duration,
            complexity: categroymeal[index].complexity,
            affordability: categroymeal[index].affordability,
            //removeitem: _removemeal,
          );
        }),
    );
  }
}