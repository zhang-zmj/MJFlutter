import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';


/*
AfterLayout
  1、获取组件大小和相对于屏幕的坐标
  2、获取组件相对于某个父组件的坐标
*/
class AfterLayoutWidget extends StatefulWidget {
  const AfterLayoutWidget({Key? key}) : super(key: key);

  @override
  State<AfterLayoutWidget> createState() => _AfterLayoutWidgetState();
}

class _AfterLayoutWidgetState extends State<AfterLayoutWidget> {

  String _text = "flutter 实战";
  Size _size = Size.zero;
  
  @override
  Widget build(BuildContext context) {
    //1、获取组件大小和相对于屏幕的坐标
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Padding(
          padding: EdgeInsets.all(8),
          child: Builder(builder: (context) {
            return GestureDetector(
              child: Text(
                "Text1：点我获取我的大小",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () => print("Text1： ${context.size}"),
            );
          })),

          AfterLayout(
              callback: (RenderAfterLayout ral) {
                print("Text2：${ral.size}, ${ral.offset}");
              },
              child: Text("Text2：flutter@wendux"),
          ),

         Builder(builder: (context) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: AfterLayout(callback: (RenderAfterLayout ral) {
                Offset offset = ral.localToGlobal(Offset.zero,
                  ancestor: context.findRenderObject()
                );
                print('A 在 Container 中占用的空间范围为：${offset & ral.size}');
              },
                child: Text("A")
              ),);
         }),
        
        Divider(),
        AfterLayout(callback: (RenderAfterLayout value){
          setState(() {
              //更新尺寸信息
              _size = value.size;
          });
        }, child: Text(_text)),

        //显示上面 Text 的尺寸
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Text Size $_size",
              style: TextStyle(color: Colors.blue)
            )
        ),

        ElevatedButton(
            onPressed: () {
              setState(() {
                _text += 'flutter 实战';
              });
            },
            child: Text("追加字符串")
        )

      ],
    );
  }

  



  Widget _getWidgetSize() {

    return Column(
      children: [
        Center(
          child: AfterLayout(
            callback: (RenderAfterLayout ral) {
              print(ral.size); //子组件的大小
              print(ral.offset);// 子组件在屏幕中坐标
            },
            child: Text('flutter@wendux'),
          ),
        ),
        SizedBox(height: 35),
        Container(
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          width: 100,
          height: 100,
          child: AfterLayout(
              callback: (RenderAfterLayout ral) {
                Offset  offset = ral.localToGlobal(Offset.zero,
                  // 传一个父级元素
                  ancestor: context.findRenderObject(),
                );
                print('A 在 Container 中占用的空间范围为：${offset & ral.size}');
              },
              child: Text("A")),
        )
      ],
    );

  }

}
