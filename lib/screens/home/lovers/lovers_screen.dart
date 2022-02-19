import 'package:flutter/material.dart';

class LoversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        elevation: 0,
      ),
      backgroundColor: Colors.amber[800],
      body: Column(
        children: [
          const SizedBox(
            width: double.maxFinite,
            height: 40,
            child: Text(
              'Apreciadores',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
