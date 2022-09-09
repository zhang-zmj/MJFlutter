import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({Key? key}) : super(key: key);

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counter(), //
      //initialData: ,// a Stream<int> or null
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError)  return Center(child: Text('Error: ${snapshot.error}'));
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: Text('没有Stream'));
          case ConnectionState.waiting:
            return Center(child: Text('等待数据...'));
          case ConnectionState.active:
            return Center(child: Text('active: ${snapshot.data}'));
          case ConnectionState.done:
            return Center(child: Text('Stream 已关闭'));
        }
      },
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 5), (i) {
      return i;
    });
  }

}
