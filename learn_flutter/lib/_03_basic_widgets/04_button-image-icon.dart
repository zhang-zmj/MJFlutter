import 'package:flutter/material.dart';

final imageURL = "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1639041228,1191619725&fm=111&gp=0.jpg";


class IconsDemo extends StatelessWidget {
  const IconsDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Icon(Icons.pets, size: 300, color: Colors.orange,);
    // return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
    // return Text("\ue91d",style: TextStyle(fontSize: 300, color: Colors.red, fontFamily: 'MaterialIcons'));

  }
}


class ImageExtension extends StatelessWidget {
  const ImageExtension({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {

    //1、占位图
    //2、图片缓存：缓存1000张，小于100M
    return FadeInImage(
      fadeInDuration: Duration(milliseconds: 1),
      fadeOutDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/juren.jpeg"),
      image: NetworkImage(imageURL),
    );
  }
}



class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //1、默认情况下Button上下有一定的间距
    //2、Button变小：ButtonTheme
    //3、Button的内边距
    return Column(
      children: <Widget>[
        ButtonTheme(
          minWidth: 20,
          height: 20,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.red,
            child: Text("Flat Button"),
            textColor: Colors.white,
            onPressed: (){},
          ),
        ),
        FlatButton(
          color: Colors.red,
          child: Text("Flat Button"),
          textColor: Colors.white,
          onPressed: (){},
        ),
      ],
    );
  }
}



