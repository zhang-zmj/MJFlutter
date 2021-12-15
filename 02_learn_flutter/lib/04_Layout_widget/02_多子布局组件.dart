import 'package:flutter/material.dart';



class ZMJHomeDemo extends StatefulWidget {
  @override
  _ZMJHomeDemoState createState() => _ZMJHomeDemoState();
}

class _ZMJHomeDemoState extends State<ZMJHomeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("基础Widget"),
        ),
        body:ZMJHomeContent()
    );
  }
}

// StatefulWidget的生命周期
class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  late bool isFavor = false;

  @override
  Widget build(BuildContext context) {


    /**
     * Row/Column: 继承自Flex
     *   Flex: CSS Flex布局, 直接使用的较少
     *   Axis.vertical: Column
     *   Axis.horizontal: Row
     */


    /**
     * Row特点:
     *  - 水平方向尽可能占据比较大的空间
     *    * 水平方向也是希望包裹内容, 那么设置mainAxisSize = min
     *  - 垂直方向包裹内容
     * MainAxisAlignment:
     *  - start: 主轴的开始位置挨个摆放元素(默认值)
     *  - end: 主轴的结束位置挨个摆放元素
     *  - center: 主轴的中心点对齐
     *  - spaceBetween: 左右两边的间距为0, 其它元素之间平分间距
     *  - spaceAround: 左右两边的间距是其它元素之间的间距的一半
     *  - spaceEvenly: 所有的间距平分空间
     * CrossAxisAlignment:
     *  - start: 交叉轴的起始位置对齐
     *  - end: 交叉轴的结束位置对齐
     *  - center: 中心点对齐(默认值)
     *  - baseline: 基线对齐(必须有文本的时候才起效果)
     *  - stretch: 先Row占据交叉轴尽可能大的空间, 将所有的子Widget交叉轴的高度, 拉伸到最大
     */


    return Stack(
      /**
       * Stack默认的大小是包裹内容的
       *  - alignment: 从什么位置开始排布所有的子Widget
       *  - fit: expand(很少) 将子元素拉伸到尽可能大
       *  - overflow: 超出部分如何处理
       * Positioned
       */
        children: [
          Image.asset("assets/images/juren.jpeg"),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  color: Color.fromARGB(150, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "进击的巨人挺不错的",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      IconButton(onPressed: (){
                        setState(() {
                          isFavor = !isFavor;
                        });
                      }, icon: Icon(
                        Icons.favorite,
                        color: isFavor ? Colors.red : Colors.white,
                      ))
                    ],
                  )
              )
          )
        ]
    );

  }

}



//5、重叠显示
class StackDemo extends StatelessWidget {
  const StackDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/juren.jpeg",
          width: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 20,
            bottom: -50,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
            )
        ),

        Positioned(
            right: 10,
            bottom: 20,
            child: Text(
              "进击的巨人",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple
              ),
            )
        )
      ],

    );
  }
}




//4、Expanded的使用
class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Container(
        height: 300,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.ideographic,

          children: [
            /**
             * Flexible中的属性:
             * - flex
             * Expanded(更多) -> Flexible(fit: FlexFit.tight)
             * 空间分配问题
             *  充满剩余的空间
             *  1:2:2:1 按比例分割屏幕空间
             */

            Expanded(child: Container(width: 100,height: 60, color: Colors.purple)),
            Container(width: 80, height: 100, color: Colors.green)

            // Expanded(flex: 1, child: Container(width: 100,height: 60, color: Colors.purple)),
            // Expanded(flex: 2, child: Container(width: 80, height: 100, color: Colors.green)),
            // Expanded(flex: 1, child: Container(width: 50, height: 120, color: Colors.orange)),
            // Expanded(flex: 2, child: Container(width: 90, height: 80, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}




// 3、Column的使用
class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      // verticalDirection: VerticalDirection.down,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.red
          ),
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 120,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.green
          ),
          child: Text(
            "World",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 90,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.blue
          ),
          child: Text(
            "zhang",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 50,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.yellow
          ),
          child: Text(
            "zhang",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}





// 2、Row和Button的结合使用
class RowWithButton extends StatelessWidget {
  const RowWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.bug_report),
          Text("bug报告")
        ],
      ),
      onPressed: (){
        print("按钮被点击了。。。。");
      },

    );
  }
}

// 1、Row的基本使用
class RowDemo extends StatelessWidget {
  const RowDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.purple
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.ideographic,
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.red
            ),
            child: Text(
              "Hello",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.green
            ),
            child: Text(
              "World",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Text(
              "zhang",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 50,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.yellow
            ),
            child: Text(
              "zhang",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}












