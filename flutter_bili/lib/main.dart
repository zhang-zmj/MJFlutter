import 'package:flutter/material.dart';
import 'package:flutter_bili/http/dao/config.dart';
import 'package:flutter_bili/model/video_list_model.dart';
import 'package:flutter_bili/pages/login_page.dart';
import 'package:flutter_bili/pages/registration_page.dart';
import 'package:flutter_bili/pages/video_detail_page.dart';
import 'package:flutter_bili/navigator/hi_navigator.dart';
import 'package:flutter_bili/utils/color.dart';
import 'package:flutter_bili/http/dao/login_dao.dart';
import 'package:flutter_bili/utils/toast.dart';
import 'navigator/botom_navigator.dart';

void main() {
  runApp(const BiliApp());
}

class BiliApp extends StatefulWidget {
  const BiliApp({Key? key}) : super(key: key);
  @override
  State<BiliApp> createState() => _BiliAppState();
}



class _BiliAppState extends State<BiliApp> {

  // final BiliRouteDelegate _routeDelegate = BiliRouteDelegate();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocalStorage>(
         // 进行初始化
          future: LocalStorage.preInit(),
          builder: (BuildContext context, AsyncSnapshot<LocalStorage> snapshot){

          //1、如果还在加载中，返回全局的loading，以下是加载中状态的判断
          // var widget = snapshot.connectionState == ConnectionState.done ?
          //     Router( routerDelegate: _routeDelegate )
          //     : const Scaffold( body: Center( child: CircularProgressIndicator()));

          // 2、加载完成后，进行加载界面
          return MaterialApp(
                  home: const BottomNavigator(),
                  theme: ThemeData(
                    primarySwatch: white
                  ),
               );
         });
    }
}




//路由的代理
// class BiliRouteDelegate extends RouterDelegate<BiliRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<BiliRoutePath>{
//
//   @override
//   final GlobalKey<NavigatorState> navigatorKey;
//   //为Navigator设置一个key，必要的时候可以通过navigatorKey.currentState来获取到NavigatorState对象
//   BiliRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
//     // 实现跳转逻辑
//       HiNavigator.getInstance()?.registerRouteJump(RouteJumpListener(onJumpTo: (RouteStatus routeStatus, {dynamic args}){
//             _routeStatus = routeStatus;
//             if (routeStatus == RouteStatus.detail) {
//               videoListModel = args["videoMo"];
//             }
//             notifyListeners();
//       }));
//   }
//
//   RouteStatus _routeStatus = RouteStatus.home;
//   List<MaterialPage> pages = [];
//   VideoListModel? videoListModel;
//
//   RouteStatus get routeStatus {
//
//     if (_routeStatus != RouteStatus.registration && !hasLogin) {
//         return _routeStatus = RouteStatus.login;
//     }else if (videoListModel != null) {
//         return _routeStatus = RouteStatus.detail;
//     }else{
//         return _routeStatus;
//     }
//   }
//
//
//   bool get hasLogin => LoginDao.getBoardingPass() != null;
//
//   @override
//   Widget build(BuildContext context) {
//     var index = getPageIndex(pages, _routeStatus);
//     List<MaterialPage> tempPages = pages;
//     if (index != -1) {
//       // 要打开的页面在栈中存在，则该页面和它上面的所有与页面进行出栈
//       // tips 具体规则可以根据需要进行调整，这里要求栈中只允许有一个同样的页面实例
//       tempPages = tempPages.sublist(0, index);
//     }
//
//     dynamic page;
//     // if (routeStatus == RouteStatus.home) {
//     //    //跳转首页时将栈中其他页面进行出栈，因为首页不可回退
//     //   pages.clear();
//       page = pageWrap(const BottomNavigator());
//     // }else if (routeStatus == RouteStatus.detail) {
//     //    page = pageWrap(const VideoDetailPage());
//     // }else if (routeStatus == RouteStatus.registration) {
//     //   page = pageWrap(const RegistrationPage());
//     // }else if (routeStatus == RouteStatus.login) {
//     //   page = pageWrap(const  LoginPage());
//     // }
//
//     //重新创建一个数组，否则page时因应用没有改变路由不会生效
//     // tempPages = [...tempPages, page];
//
//     //通知路由发生变化
//     HiNavigator.getInstance()?.notify(tempPages, pages);
//
//     pages = tempPages;
//
//     return WillPopScope(
//       //fix Android物理返回键，无法返回上一页问题@https://github.com/flutter/flutter/issues/66349
//         onWillPop: () async => !(await navigatorKey.currentState?.maybePop() ?? false),
//       child: Navigator(
//         key: navigatorKey,
//         pages: pages,
//         onPopPage: (route, result) {
//           if (route.settings is MaterialPage) {
//            //  登录页未登录返回拦截
//             if ((route.settings as MaterialPage).child is LoginPage ){
//               if (!hasLogin) {
//                 showWarnToast("请先登录");
//                 return false;
//               }
//             }
//           }
//
//           if (!route.didPop(result))  {
//             return false;
//           }
//           var temPages =  [...pages];
//           pages.removeLast();
//           //通知 路由发生变化
//           HiNavigator.getInstance()?.notify(pages, temPages);
//           return true;
//         },
//       ));
//   }
//
//   @override
//   Future<void> setNewRoutePath(BiliRoutePath path) async {}
//
// }
//
// // 定义路由数据，path
// class BiliRoutePath{
//   final String? location;
//   BiliRoutePath.home():location = "/";
//   BiliRoutePath.detail(): location = "/detail";
// }





