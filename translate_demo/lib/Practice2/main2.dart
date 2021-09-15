import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:translate_demo/Practice1/localizations.dart';
import 'package:translate_demo/Practice1/localizations_delegate.dart';


main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          Locale("en"),
          Locale("zh")
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ZMJLocalizationsDelegate.delegate
        ],
        home: ZMJHomePage()
    );
  }

}

class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        title: Text(ZMJLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ZMJLocalizations.of(context).hello, style: TextStyle(fontSize: 20)),
            RaisedButton(
                child: Text(ZMJLocalizations.of(context).pickTime, style: TextStyle(fontSize: 20)),
                onPressed: (){
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000)
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}




