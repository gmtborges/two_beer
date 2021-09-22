import 'package:flutter/material.dart';
import 'add_beer_view.dart';
import 'catalog_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectView(int index) {
    switch (index) {
      case 0:
        return CatalogView();
      case 1:
        return AddBeerView();
      case 2:
        return LoversView();
      case 3:
        return ProfileView();
      default:
        setState(() {
          _selectedIndex = 0;
        });
        return CatalogView();
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
      body: _selectView(_selectedIndex),
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

class LoversView extends StatelessWidget {
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

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Perfil',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
