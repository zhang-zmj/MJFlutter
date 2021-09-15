import 'package:flutter/material.dart';

main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ZMJHomePage()
    );
  }

}

class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Text组件"),
      ),
      body: ZMJHomeContent(),
    );
  }
}


class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  @override
  Widget build(BuildContext context) {

    /*
   *  Stack默认的大小是包裹内容的
   *   - alignment：从什么位置开始排布所有的子Widget
   *   - fit： expand 将子元素拉伸到尽可能大
   *   - overflow：超出部分如何处理
   *   -
   *
   */
    return Stack(
      children: <Widget>[

        Image.asset("assets/images/juren.jpeg"),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(255, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("进击的巨人挺不错的", style: TextStyle(fontSize: 20, color: Colors.white)),
                IconButton(
                    icon: Icon(Icons.favorite,color: _isFavor ? Colors.red : Colors.white),
                    onPressed: (){
                      setState(() {
                        _isFavor = !_isFavor;
                      });
                    })
              ],
            ),
          ),
        )

      ],
    );
  }

}







class StackDemo1 extends StatelessWidget {
  const StackDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        // fit: StackFit.expand,
        // overflow:Overflow.visible,
        children: <Widget>[
          Image.asset("assets/images/juren.jpeg",width: 300,fit: BoxFit.cover,),
          Positioned(
            left: 20,
            bottom: -50,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
            ),
          ),
          Positioned(right: 10, bottom: 20,child: Text("追击的巨人",style: TextStyle(fontSize: 20,color: Colors.blue),))
        ],
      ),
    );
  }
}






class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*
    * Row特点：
    *   - 水平方向尽可能占据比较大的空间
    *       * 水平方向也是希望包裹内容，那么设置mainAxisSize = min
    *   - 垂直方向包裹内容
    *
    *  MainAxisAlignment：
    *   - start： 主轴的开始位置挨个摆放元素
    *   - end：   主轴的结束位置挨个摆放元素
    *   - center：主轴的中心点对齐
    *   - spaceBetween：左右两边的间距为0，其他元素之间平分间距
    *   - spaceAround： 左右两边的间距是其他元素之间的间距的一半
    *   - spaceEvenly：所有的间距平分空间
    *
    *  CrossAxisAlignment：
    *   - start： 交叉轴的起始位置对齐
    *   - end：   交叉轴的结束位置对齐
    *   - center：中心点对齐(默认值)
    *   - baseline：基线对齐(必须有文本的时候才起效果)
    *   - stretch： 先Row占据交叉轴尽可能大的空间，将所有的子widget交叉轴的高度，拉伸到最大
    */

    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          /**
           * Flexible中的属性:
           * - flex
           * Expanded(更多) -> Flexible(fit: FlexFit.tight)
           * 空间分配问题
           * flex：比例缩放
           */
          Expanded(
              child: Container(height: 60, color: Colors.red)
          ),
          Expanded(
              flex: 2,
              child: Container(width: 1000, height: 100, color: Colors.green)
          ),
          Container(width: 90, height: 80, color: Colors.blue),
          Container(width: 50, height: 120, color: Colors.orange),
        ],
      ),

    );
  }
}




class ColumDemo extends StatelessWidget {

  const ColumDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[

        Container(width: 80, height: 60,color: Colors.red, child: Text("hello", style: TextStyle(fontSize: 20))),
        Container(width: 120, height: 100,color: Colors.green, child: Text("world", style: TextStyle(fontSize: 20))),
        Container(width: 90, height: 80,color: Colors.blue, child: Text("abc", style: TextStyle(fontSize: 20))),
        Container(width: 50, height: 120,color: Colors.blue, child: Text("cxba", style: TextStyle(fontSize: 20)))

      ],
    );
  }

}



class RowDemo extends StatelessWidget {
  const RowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.deepOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        // textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Container(width: 80, height: 60,color: Colors.red, child: Text("hello", style: TextStyle(fontSize: 20))),
          Container(width: 120, height: 100,color: Colors.green, child: Text("world", style: TextStyle(fontSize: 20))),
          Container(width: 90, height: 80,color: Colors.blue, child: Text("abc", style: TextStyle(fontSize: 20))),
          Container(width: 50, height: 120,color: Colors.blue, child: Text("cxba", style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}



class ButtonRowDemo extends StatelessWidget {
  const ButtonRowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.bug_report),
          Text("bug报告")
        ],
      ),
      onPressed: () => print("按钮被点击"),
    );
  }
}
