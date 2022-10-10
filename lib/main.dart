import 'package:flutter/material.dart';
import './models/meal.dart';
import './screens/splash_start_screen.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/category_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';


void main() {
  runApp(const SplashStatrScreen());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };
  
  List<Meal> favoritemeals=[];
  void _toggleFavorite(String mealid){
   final exiteindex= favoritemeals.indexWhere((meal) => meal.id==mealid);
   if(exiteindex>=0){
     setState(() {
       favoritemeals.removeAt(exiteindex);
     });
   }
   else{
    favoritemeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealid));
   }
  }

  var _availableMeals=DUMMY_MEALS;
  void _setfilter(Map<String, bool> _filterData){
      setState(() {
        _filters=_filterData;

        _availableMeals=DUMMY_MEALS.where((meal) {
        if(_filters['gluten']&& !meal.isGlutenFree){
          return false;
        };
        if(_filters['lactose']&& !meal.isLactoseFree){
          return false;
        };
        if(_filters['vegan']&& !meal.isVegan){
          return false;
        };
        if(_filters['vegetarian']&& !meal.isVegetarian){
          return false;
        };
        return true;
        }).toList();
      });
  }
  bool IsMealFavorite(String id){
    return favoritemeals.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        cursorColor: Color.fromRGBO(255, 205, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          headline4: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      //home:CategoryScreen(),
      routes: {
        '/':(context)=>TabsScreen(favoritemeals),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(_toggleFavorite,IsMealFavorite),
        FiltersScreen.routeName:(context)=>FiltersScreen(_setfilter,_filters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, }) : super(key: key);

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: CategoryScreen(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), 
    );
  }
}
