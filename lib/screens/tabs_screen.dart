import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,Object>> _pages;
  int _selectedPageIndex=0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  void initState() {
    _pages=[
      {
        'page':CategoriesScreen(),
        'title':'Categories'
      },
      {
        'page':FavoritesScreen(favoriteMeals: widget.favoriteMeals,),
        'title':'Favorites'},
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
        drawer:Drawer(
          child: MainDrawer(),
        ),
        body:_pages[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
            currentIndex: _selectedPageIndex,
            // type: BottomNavigationBarType.shifting,
            onTap:_selectPage,
          backgroundColor: Theme.of(context).primaryColor,
             items: [
              BottomNavigationBarItem(icon:Icon(Icons.category,),
                   title: Text('Category '),backgroundColor: Theme.of(context).primaryColor,),
               BottomNavigationBarItem(icon:Icon(Icons.star),
                   title: Text('Favorites'),
                 backgroundColor: Theme.of(context).primaryColor,)
      ],
      ),
    );
  }
}
