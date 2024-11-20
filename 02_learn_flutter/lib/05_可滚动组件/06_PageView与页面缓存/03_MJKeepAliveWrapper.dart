import 'package:flutter/material.dart';

/*
KeepAliveWrapper
    比如一个组件能同时在列表中和列表外使用，为了在列表中缓存它，则我们必须实现两份。
    为了解决这个问题，笔者封装了一个 KeepAliveWrapper 组件，如果哪个列表项需要缓存，
    只需要使用 KeepAliveWrapper 包裹一下它即可。
*/

class MJKeepAliveWrapperWidget extends StatefulWidget {
  const MJKeepAliveWrapperWidget({super.key});

  @override
  State<MJKeepAliveWrapperWidget> createState() => _MJKeepAliveWrapperWidgetState();
}

class _MJKeepAliveWrapperWidgetState extends State<MJKeepAliveWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (_, index) {
          return KeepAlive(
              // 为 true 后会缓存所有的列表项，列表项将不会销毁。
              // 为 false 时，列表项滑出预加载区域后将会别销毁。
              // 使用时一定要注意是否必要，因为对所有列表项都缓存的会导致更多的内存消耗
              keepAlive: false,
              child: ListItem(index: index));
        });
    ;
  }
}

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.index});
  final int index;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text('${widget.index}'));
  }

  @override
  void dispose() {
    debugPrint('dispose ${widget.index}');
    super.dispose();
  }
}
