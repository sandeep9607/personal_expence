import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('title'),
            Text('Prodect'),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                ),
                Container(
                  child: Column(
                    children: [
                      Text('resean prodeka'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
