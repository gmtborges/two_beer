import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';

class BeerDetails extends StatelessWidget {
  final Beer selectedBeer;

  BeerDetails(this.selectedBeer);

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Mais informações',
            style: TextStyle(
                color: Colors.grey.shade800, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0),
      body: Container(
        child: Text(selectedBeer.name),
      ),
    );
  }
}
