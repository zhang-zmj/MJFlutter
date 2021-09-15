import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/Pages/home/home_movie_item.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/model/home_request.dart';



class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    //发送网络请求
    HomeRequest.requestMovieList(0).then((res) {
      setState(() {
        print(res);
        movies.addAll(res);
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (ctx, index){
            return ZMJHomeMovieItem(movies[index]);
        }
    );
  }
}





