import 'package:flutter/material.dart';


//Widget是不加_（下划线）的，暴露给别人使用的
class ZMJHomeContent extends StatefulWidget {

  final String message;
  ZMJHomeContent(this.message);

  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();

}

//State是加_，状态这个类只是给widget使用
class _ZMJHomeContentState extends State<ZMJHomeContent> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff6A5ACD))
                  ),
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  }),

              ElevatedButton(
                  child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xffFF1493))
                  ),
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  })
            ],

          ),
          Text("当前计数：$_counter", style: TextStyle(fontSize: 20)),
          Text("传递的信息，${widget.message}", style: TextStyle(fontSize: 20))
        ],
      ),

    );
  }
}
