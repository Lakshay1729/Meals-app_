import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  static const routeName='/filters';
  final Map<String,bool> currentFilters;

  @override
  _FiltersScreenState createState()=>_FiltersScreenState();
}


class _FiltersScreenState extends State<FiltersScreen> {
bool _glutenFree= false;
bool _vegetarian = false;
bool _vegan=false;
bool _lactoseFree=false;
@override
initState(){
  _glutenFree=widget.currentFilters['gluten'];
  _lactoseFree=widget.currentFilters['lactose'];
  _vegetarian=widget.currentFilters['vegetarian'];
  _vegan=widget.currentFilters['vegan'];
  super.initState();
}
Widget _buildSwitchListTile(String title,String description, bool currentValue,Function updateValue ,){
  return SwitchListTile(title: Text(title),
    value:currentValue,
    subtitle: Text(description,),
    onChanged: updateValue,
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FiltersScreen'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.save),onPressed:(){
            final selectedFilters= {
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }),

      ],
      ),
      body:Column(
      children:<Widget>[
      Container(
      padding: EdgeInsets.all(20),
      child:Text( 'Adjust your meal selection',
      style:Theme.of(context).textTheme.title,),
      ),
      Expanded(child: ListView(children: [
      _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals.', _glutenFree, (newValue){
      setState((){
      _glutenFree=newValue;
      });
      }),
      _buildSwitchListTile('Lactose-Free', 'Only include lactose-free meals.', _lactoseFree, (newValue){
              setState((){
                _lactoseFree=newValue;
              });
            }),

            _buildSwitchListTile('Vegetarian', 'Only include vegetarian meals.', _vegetarian, (newValue){
              setState((){
                _vegetarian=newValue;
              });
            }),

            _buildSwitchListTile('Is vegan?', 'Include only vegan or non-vegan food.',_vegan, (newValue){
              setState((){
                _vegan=newValue;
              });
            }),
          ],),)
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),);
  }
}
