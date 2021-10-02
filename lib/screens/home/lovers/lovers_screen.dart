import 'package:flutter/material.dart';

class LoversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              child: Text(
                'Buscar apreciadores',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
