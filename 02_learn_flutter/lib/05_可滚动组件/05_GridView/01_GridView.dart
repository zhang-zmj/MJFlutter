import 'package:flutter/material.dart';

class MJGridViewWidget extends StatefulWidget {
  const MJGridViewWidget({super.key});

  @override
  State<MJGridViewWidget> createState() => _MJGridViewWidgetState();
}

class _MJGridViewWidgetState extends State<MJGridViewWidget> {
  final List _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //每行三列
            crossAxisCount: 3,
            //显示区域宽高相等
            childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return _icons[index];
        },
        itemCount: _icons.length);
  }

//模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Container(
            color: Colors.red,
            child: const Text("text"),
          ),
          Container(
            color: Colors.yellow,
            child: const Text("text"),
          ),
          Container(
            color: Colors.blue,
            child: const Text("text"),
          ),
          Container(
            color: Colors.green,
            child: const Text("text"),
          ),
          Container(
            color: Colors.cyan,
            child: const Text("text"),
          ),
          Container(
            color: Colors.pink,
            child: const Text("text"),
          ),
        ]);
      });
    });
  }

//  1、创建横轴固定数量子元素的GridView
  Widget gridView_count() {
    return GridView.count(crossAxisCount: 3, childAspectRatio: 1.0, children: const [
      Icon(Icons.ac_unit),
      Icon(Icons.airport_shuttle),
      Icon(Icons.all_inclusive),
      Icon(Icons.beach_access),
      Icon(Icons.cake),
      Icon(Icons.free_breakfast)
    ]);
  }

//  2、创建横轴固定数量子元素的GridView
  Widget gridView_extent() {
    return GridView.extent(
      maxCrossAxisExtent: 120,
      childAspectRatio: 2.0,
      children: const [
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
