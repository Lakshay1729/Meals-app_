import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,Object>> _pages=[
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoritesScreen(),'title':'Favorites'},
  ];
  int _selectedPageIndex=0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      bottom: TabBar(
      tabs:<Widget>[
        Tab(icon:Icon(Icons.category),text: 'Categories ',),
        Tab(icon: Icon(Icons.star),text: 'Favourites',),
      ],),
      ),
        body:_pages[_selectedPageIndex]['page'],
        // TabBarView(children:  <Widget>[
        //   CategoriesScreen(),
        //   FavoritesScreen()
        // ],),
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

    ),);
  }
}
