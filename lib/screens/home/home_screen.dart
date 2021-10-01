import 'package:flutter/material.dart';
import 'catalog/catalog_screen.dart';
import 'add_beer/add_beer_screen.dart';
import 'profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectScreen(int index) {
    switch (index) {
      case 0:
        return CatalogScreen();
      case 1:
        return AddBeerScreen();
      case 2:
        return LoversScreen();
      case 3:
        return ProfileScreen();
      default:
        setState(() {
          _selectedIndex = 0;
        });
        return CatalogScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2Beer',
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: _selectedIndex == 0
            ? <Widget>[
                IconButton(icon: Icon(Icons.search), onPressed: null),
                IconButton(icon: Icon(Icons.sort), onPressed: null),
              ]
            : [],
      ),
      backgroundColor: Colors.grey[100],
      body: _selectScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Catálogo',
            icon: Icon(Icons.list_alt),
          ),
          BottomNavigationBarItem(
            label: 'Adicionar',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Apreciadores',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.account_box_outlined),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class LoversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Buscar apreciadores',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
