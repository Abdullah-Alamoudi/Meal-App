import 'package:flutter/material.dart';

import '../screens/maindrawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key key}) : super(key: key);
  static const routeName = 'Filter';
  final Function(Map<String, bool>) saveFilter;
  final Map<String, bool> cuttentFilter;

  FiltersScreen(this.saveFilter, this.cuttentFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  SwitchListTile BuildListTile(String title, String description,
      bool currentvalue, Function updatevalue) {
    return SwitchListTile(
        value: currentvalue,
        title: Text(title),
        subtitle: Text(description),
        onChanged: updatevalue);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GlutenFree = widget.cuttentFilter['gluten'];
    _LactoseFree = widget.cuttentFilter['lactose'];
    _Vegan = widget.cuttentFilter['vegan'];
    _Vegetarian = widget.cuttentFilter['vegetarian'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectFilter = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian
              };

              return widget.saveFilter(selectFilter);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              BuildListTile(
                  'GlutenFree', 'Only include gleaten free meals', _GlutenFree,
                  (value) {
                setState(() {
                  _GlutenFree = value;
                });
              }),
              BuildListTile('LactoseFree', 'Only include Lactose free meals',
                  _LactoseFree, (value) {
                setState(() {
                  _LactoseFree = value;
                });
              }),
              BuildListTile('Vegan', 'Only include Vegan free meals', _Vegan,
                  (value) {
                setState(() {
                  _Vegan = value;
                });
              }),
              BuildListTile('Vegetarian', 'Only include Vegetarian free meals',
                  _Vegetarian, (value) {
                setState(() {
                  _Vegetarian = value;
                });
              })
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
