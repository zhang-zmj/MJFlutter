import 'package:flutter/material.dart';

class SliverWidget extends StatefulWidget {
  const SliverWidget({Key? key}) : super(key: key);

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          //AppBar包含一个导航栏
          SliverAppBar(
            pinned: true,  // 滑动到顶端时会固定住
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Image.asset(
                "assets/images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //Grid按两列显示
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 4.0
                  ),
                  delegate: SliverChildBuilderDelegate( (context, index) {
                      //创建子widget
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: Text('grid item $index'),
                      );
                  }, childCount: 20
                  )
              ),
          ),

          SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate( (context, index) {
                  //创建列表项
                  return Container(
                    alignment: Alignment.center,
                    color:  Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
              },
              childCount: 20
              )
          )
        ]
      ),
    );
  }
}
