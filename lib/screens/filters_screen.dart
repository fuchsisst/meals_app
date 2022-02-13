import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue, Function(bool)? onChanged){
    return  SwitchListTile(title: Text(title), subtitle: Text(subtitle), value: currentValue, onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: const Text('Your Filters'),),
      drawer: const  MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection', style: Theme.of(context).textTheme.subtitle1,),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              _buildSwitchListTile('Gluten-Free', 'Only include gluten-free meals.', _glutenFree, (newValue){setState(() {
                _glutenFree = newValue;
              });}),
              _buildSwitchListTile('Vegetarian', 'Only include vegetarian meals.', _vegetarian, (newValue){setState(() {
                _vegetarian = newValue;
              });}),
              _buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan, (newValue){setState(() {
                _vegan = newValue;
              });}),
              _buildSwitchListTile('Lactose-Free', 'Only include lactose-free meals.', _lactoseFree, (newValue){setState(() {
                _lactoseFree = newValue;
              });}),
            ],
          ))
        ],
      )
    );
  }
}
