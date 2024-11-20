import 'package:flutter/material.dart';

class MJInfiniteWidget extends StatefulWidget {
  const MJInfiniteWidget({super.key});

  @override
  State<MJInfiniteWidget> createState() => _MJInfiniteWidgetState();
}

class _MJInfiniteWidgetState extends State<MJInfiniteWidget> {
  String loadingTag = "##loading##"; //表尾标记
  final _words = [];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _words.length,
        separatorBuilder: (context, index) => const Divider(height: 1.0),
        itemBuilder: (context, index) {
          debugPrint("-------${_words.length}------");

          //如果到了表尾
          if (index == _words.length - 1) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: const Text("没有更多了", style: TextStyle(color: Colors.grey)),
              );
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]));
        });
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          setState(() {
            //重新构建列表
            _words.addAll(loadingTag.split("").toList());
          })
        });
  }
}
