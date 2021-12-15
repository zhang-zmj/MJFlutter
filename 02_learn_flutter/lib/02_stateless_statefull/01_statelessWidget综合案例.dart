import 'package:flutter/material.dart';

class ZMJHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8),
        ZMJHomeProductItem("Apple1", "MackBook1",
            "https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF"),
        SizedBox(height: 8),
        ZMJHomeProductItem("Apple2", "MackBook2",
            "https://t7.baidu.com/it/u=4198287529,2774471735&fm=193&f=GIF"),
        SizedBox(height: 8),
        ZMJHomeProductItem("Apple3", "MackBook3",
            "https://t7.baidu.com/it/u=727460147,2222092211&fm=193&f=GIF"),
        SizedBox(height: 8),
      ],
    );
  }
}

class ZMJHomeProductItem extends StatelessWidget {
  final String title;
  final String dec;
  final String imageURL;

  final style1 =  TextStyle(fontSize: 25, color: Colors.orange);
  final style2 =  TextStyle(fontSize: 20, color: Colors.blue);

  ZMJHomeProductItem(this.title, this.dec, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 25, color: Colors.orange)),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 25, color: Colors.orange)),
          SizedBox(height: 8),
          Image.network(imageURL)
        ],
      ),
    );
  }
}





