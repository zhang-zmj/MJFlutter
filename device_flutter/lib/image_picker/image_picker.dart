
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

class ZMJHomePage extends StatefulWidget {
  @override
  _ZMJHomePageState createState() => _ZMJHomePageState();
}

class _ZMJHomePageState extends State<ZMJHomePage> {

  final _picker = ImagePicker();
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("选择照片"),
                onPressed: _pickImage
            ),
            Container(height: 300,child: _image == null ? Text("请选择一张图片") : Image.file(_image))
          ],
        ),
      ),
    );
  }

  void _pickImage() async{
    //camera：相机
    //gallery：相册
    print("拾取照片----------------");
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    final File file = File(pickedFile.path);
    setState(() {
      _image = file;
    });
  }


}







