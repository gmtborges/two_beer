import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';

class AddBeerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddBeerScreenState();
}

class _AddBeerScreenState extends State<AddBeerScreen> {
  final _nameController = TextEditingController();

  Future<void> _saveBeer() async {
    String name = _nameController.text;

    Beer newBeer = Beer(name: name, ibu: 10, isFavorite: false);

    try {
      await Amplify.DataStore.save(newBeer);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Adicionar cerveja',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(filled: true, labelText: 'Nome'),
          ),
          ElevatedButton(
            onPressed: _saveBeer,
            child: Text('Salvar'),
          )
        ],
      ),
    );
  }
}
