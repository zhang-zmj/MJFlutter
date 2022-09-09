import 'dart:math';
import 'package:flutter/material.dart';
import 'package:learn_flutter/08_%E8%87%AA%E5%AE%9A%E4%B9%89%E7%BB%84%E4%BB%B6/02_%E7%BB%84%E5%90%88%E5%AE%9E%E4%BE%8B/01_TurnBox.dart';
import '01_GradientCircularProgress.dart';

class GradientCircularProgressRoute extends StatefulWidget {
  const GradientCircularProgressRoute({Key? key}) : super(key: key);
  @override
  State<GradientCircularProgressRoute> createState() => _GradientCircularProgressRouteState();
}

class _GradientCircularProgressRouteState extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      }else if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        }else{
          _animationController.forward();
        }
      }else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                        children: [
                          Wrap(
                            spacing: 10,
                            runSpacing: 16,
                            children: [
                             GradientCircularProgressIndicator(
                                 radius: 50,
                                 colors: [Colors.blue, Colors.blue],
                                strokeWidth: 3,
                               value: _animationController.value,
                             ),

                              GradientCircularProgressIndicator(
                                radius: 50,
                                colors: [Colors.red, Colors.orange],
                                strokeWidth: 3,
                                value: _animationController.value,
                              ),

                              GradientCircularProgressIndicator(
                                radius: 50,
                                colors: [Colors.red, Colors.orange, Colors.red],
                                strokeWidth: 5,
                                value: _animationController.value,
                              ),

                              GradientCircularProgressIndicator(
                                radius: 50,
                                colors: [Colors.teal, Colors.cyan],
                                strokeWidth: 5,
                                strokeCapRound: true,
                                value: CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.decelerate
                                ).value
                              ),

                              TurnBox(
                                turns:  1 / 8,
                                child:  GradientCircularProgressIndicator(
                                  colors: [
                                    Colors.blue.shade700,
                                    Colors.blue.shade200
                                  ],
                                  radius: 50,
                                  strokeWidth: 3,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.transparent,
                                  value: _animationController.value,
                                ),
                              ),

                              RotatedBox(
                                  quarterTurns: 1,
                                  child:  GradientCircularProgressIndicator(
                                    colors: [
                                      Colors.blue.shade700,
                                      Colors.blue.shade200
                                    ],
                                    radius: 50,
                                    strokeWidth: 3,
                                    strokeCapRound: true,
                                    backgroundColor: Colors.transparent,
                                    value: _animationController.value,
                                  )
                              ),
                              GradientCircularProgressIndicator(
                                colors: [
                                  Colors.red,
                                  Colors.amber,
                                  Colors.cyan,
                                  Colors.green.shade200,
                                  Colors.blue,
                                  Colors.red
                                ],
                                radius: 50.0,
                                strokeWidth:5 ,
                                strokeCapRound: true,
                                value: _animationController.value,
                              )
                            ]
                          ),

                          GradientCircularProgressIndicator(
                            colors: [Colors.blue.shade700, Colors.blue.shade200],
                            radius: 100.0,
                            strokeWidth: 20.0,
                            value: _animationController.value,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.blue.shade700, Colors.blue.shade300],
                              radius: 100.0,
                              strokeWidth: 20.0,
                              value: _animationController.value,
                              strokeCapRound: true,
                            ),
                          ),

                          //剪裁半圆
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: .5,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  //width: 100.0,
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      colors: [Colors.teal, Colors.cyan.shade500],
                                      radius: 100.0,
                                      strokeWidth: 8.0,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 104.0,
                            width: 200.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Positioned(
                                  height: 200.0,
                                  top: .0,
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      colors: [Colors.teal, Colors.cyan.shade500],
                                      radius: 100.0,
                                      strokeWidth: 8.0,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "${(_animationController.value * 100).toInt()}%",
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )

                        ],
                    )
                );
              }
          )
        ]
      ),
    );
  }
}
