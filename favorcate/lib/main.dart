import 'package:favorcate/core/router/route.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'core/viewmodel/filter_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';

void main() {
  // Provider -> ViewModel/Provider/Consumer(Selector)
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (ctx) => ZMJFilterViewModel()),
            ChangeNotifierProxyProvider<ZMJFilterViewModel, ZMJMealViewModel>(
              create: (ctx) => ZMJMealViewModel(),
              update: (ctx, filterVM, mealVM) {
                mealVM.updateFilters(filterVM);
                return mealVM;
              },
            ),
            ChangeNotifierProxyProvider<ZMJFilterViewModel, ZMJFavorViewModel>(
              create: (ctx) => ZMJFavorViewModel(),
              update: (ctx, filterVM, favorVM) {
                favorVM.updateFilters(filterVM);
                return favorVM;
              },
            ),
         ],
        child: MyApp(),
      )
  );
}

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ZMJSizeFit.initialize();

    return  MaterialApp(
      title: "美食广场",
      debugShowCheckedModeBanner: false,
      theme: ZMJAppTheme.norTheme,
      darkTheme: ZMJAppTheme.darkTheme,
      initialRoute: ZMJRouter.initialRoute,
      routes: ZMJRouter.routes,
      onGenerateRoute: ZMJRouter.generateRoute,
      onUnknownRoute: ZMJRouter.unknownRoute,
    );
  }

}

