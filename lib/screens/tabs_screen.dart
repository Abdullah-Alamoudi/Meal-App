import 'package:flutter/material.dart';
import '../models/meal.dart';
import './category_screen.dart';
import './favorites_screen.dart';
import './maindrawer.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key key}) : super(key: key);
final List<Meal> favoritemeals;

   TabsScreen(this.favoritemeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  int currentindex=0;
  void selectpage(int value) {
      setState(() {
        currentindex=value;
      });
   }

    List<Map<String, Object>> page;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page=[
    {
      'page':CategoryScreen(),
      'title':'Category'
    },
    {
      'page':FavoriteScreen(widget.favoritemeals),   // it done map here becuase can't define widget without initial or build context the same bottom
      'title':'your Favorite'
    }
   ];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page[currentindex]['title']),
      ),
      body: page[currentindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites'
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
  
 
}
