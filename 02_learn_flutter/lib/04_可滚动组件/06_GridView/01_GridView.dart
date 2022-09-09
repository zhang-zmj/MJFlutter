import 'package:flutter/material.dart';

  class GridViewWidget extends StatefulWidget {
      @override
      _GridViewWidgetState createState() => _GridViewWidgetState();
  }

  class _GridViewWidgetState extends State<GridViewWidget> {
      List<IconData> _icons = []; //保存Icon数据

      @override
      void initState() {
      super.initState();
        // 初始化数据
        _retrieveIcons();
      }

      @override
      Widget build(BuildContext context) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0, //显示区域宽高相等
              ),
              itemCount: _icons.length,
              itemBuilder: (context, index) {
                  //如果显示到最后一个并且Icon总数小于200时继续获取数据
                  if (index == _icons.length - 1 && _icons.length < 200) {
                  _retrieveIcons();
                  }
                  return Icon(_icons[index]);
              },
          );
      }

  //模拟异步获取数据
  void _retrieveIcons() {
      Future.delayed(Duration(milliseconds: 200)).then((e) {
          setState(() {
              _icons.addAll([
                Icons.ac_unit,
                Icons.airport_shuttle,
                Icons.all_inclusive,
                Icons.beach_access,
                Icons.cake,
                Icons.free_breakfast,
              ]);
          });
      });
  }

//  1、创建横轴固定数量子元素的GridView
  Widget gridView_count() {

    return  GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: [
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ]
    );

  }


//  2、创建横轴固定数量子元素的GridView
  Widget gridView_extent() {

     return GridView.extent(
        maxCrossAxisExtent: 120,
        childAspectRatio: 2.0,
        children: [
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
        ],
      );

  }

}

