import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';
import 'home_content.dart';
import 'home_app_bar.dart';

class ZMJHomeScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZMJHomeAppBar(context),
      body: ZMJHomeContent(),
    );
  }
}




