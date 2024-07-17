import 'package:flutter/material.dart';

class CollapseHeader extends StatefulWidget {
  @override
  _CollapseHeaderState createState() => _CollapseHeaderState();
}

class _CollapseHeaderState extends State<CollapseHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            centerTitle: true,
            // Provide a standard title.
            title: Text(
              'Apppbar Title',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              background: Image.asset('assets/images/OIP.jpg'),
            ),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 800,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 200,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          )
          // Next, create a SliverList
          // SliverList(
          //   // Use a delegate to build items as they're scrolled on screen.
          //   delegate: SliverChildBuilderDelegate(
          //     // The builder function returns a ListTile with a title that
          //     // displays the index of the current item.
          //     (context, index) => ListTile(title: Text('Item #$index')),
          //     // Builds 1000 ListTiles
          //     childCount: 100,
          //   ),
          // ),
        ],
      ),
    );
  }
}
