import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal expensese'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text('Home'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.red,
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.green,
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.blue,
                ),
              ],
            ),
            Text('Recent Product'),
          ],
        ),
      ),
    );
  }
}
