import 'package:flutter/material.dart';
import 'catalog/catalog_screen.dart';
import 'add_beer/add_beer_screen.dart';
import 'lovers/lovers_screen.dart';
import 'profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    CatalogScreen(),
    AddBeerScreen(),
    LoversScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blueGrey.shade200,
            labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 14))),
        child: NavigationBar(
          height: 56,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.list_alt),
              label: 'Catálogo',
            ),
            NavigationDestination(
              icon: Icon(Icons.add),
              label: 'Adicionar',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Apreciadores',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Perfil',
            )
          ],
        ),
      ),
    );
  }
}
