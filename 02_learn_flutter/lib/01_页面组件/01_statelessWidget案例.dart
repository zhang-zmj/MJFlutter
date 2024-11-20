import 'package:flutter/material.dart';

class MJHomeStateLessWidget extends StatelessWidget {
  const MJHomeStateLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: const [
          SizedBox(height: 8),
          MJHomeProductItemWidget(
              "Apple1", "MackBook1", "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF"),
          SizedBox(height: 8),
          MJHomeProductItemWidget(
              "Apple2", "MackBook2", "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF"),
          SizedBox(height: 8),
          MJHomeProductItemWidget(
              "Apple3", "MackBook3", "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF"),
          SizedBox(height: 8),
          MJHomeProductItemWidget(
              "Apple4", "MackBook4", "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF"),
          SizedBox(height: 8),
          MJHomeProductItemWidget("Apple5", "MackBook5", "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF")
        ],
      ),
    );
  }
}

class ZMJHomePage extends StatelessWidget {
  const ZMJHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: const MJHomeStateLessWidget(),
    );
  }
}

class MJHomeProductItemWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  final style1 = const TextStyle(fontSize: 25, color: Colors.orange);
  final style12 = const TextStyle(fontSize: 25, color: Colors.blue);

  const MJHomeProductItemWidget(this.title, this.desc, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title, style: style1),
        const SizedBox(height: 8),
        Image.network(imageUrl),
        const SizedBox(height: 8),
        Text(title, style: style12)
      ]),
    );
  }
}
