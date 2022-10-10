import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  ListTile BuildListTile(String te,IconData ic,Function tapHandler) {
    return ListTile(
          leading: Icon(ic,size: 26,),
          title: Text(te,style:const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          ),),
          onTap: tapHandler,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30
                  ),
            ),
          ),
          SizedBox(height: 20,),
          BuildListTile('Meal',Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          BuildListTile('Filter',Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }

  
}
