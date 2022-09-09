import 'package:flutter/material.dart';


class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      children: [
        Text('I\'m dedicating every day to you', style: TextStyle(color: Colors.red)),
        SizedBox( height: 30),

        Text('Domestic life was never quite my style', style: TextStyle(color: Colors.green)),
        SizedBox( height: 30),

        Text('When you smile, you knock me out, I fall apart', style: TextStyle(color: Colors.yellow)),

        SizedBox( height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink))
      ],
      
    );
  }
}



