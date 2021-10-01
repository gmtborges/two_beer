import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
