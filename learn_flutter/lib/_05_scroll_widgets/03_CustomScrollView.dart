import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Slivers Demo"),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hello World"),
              background: Image.asset("assets/images/juren.jpeg", fit: BoxFit.cover,),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2
            ),
            delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int int) {
                  return Container(color: Color.fromARGB(255, Random().nextInt(
                      256), Random().nextInt(256), Random().nextInt(256)));
                },
                childCount: 10
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int index) {
                  return ListTile(
                    leading: Icon(Icons.people),
                    title: Text("联系人$index"),
                  );
                },
                childCount: 20
            ),
          )
        ],
      ),
    );
  }
}

class CustomScrollView1 extends StatelessWidget {
  const CustomScrollView1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5
              ),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx, int int) {
                    return Container(color: Color.fromARGB(255, Random().nextInt(
                        256), Random().nextInt(256), Random().nextInt(256)));
                  },
                  childCount: 100
              ),
            ),
          ),
        )
      ],
    );
  }
}