import 'home_model.dart';
import 'package:learn_flutter/_06_service/config.dart';
import 'package:learn_flutter/_06_service/http_request.dart';

class HomeRequest {

  static Future<List<MovieItem>> requestMovieList(int start) async {

    // 1.构建URL
    final movieURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    // final movieURL = "page=$start";
    print("---------------$movieURL");

    // 2.发送网络请求获取结果
    final result = await HttpRequest.request(movieURL);
    final subjects = result["subjects"];

    // 3.将Map转成Model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    print(movies);
    return movies;

  }

}




