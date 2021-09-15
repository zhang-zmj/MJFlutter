import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'counter_view_model.dart';
import 'user_view_model.dart';
import '../model/user_info.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => HYCounterViewModel(),),
  ChangeNotifierProvider(create: (ctx) => HYUserViewModel(UserInfo("why", 29, "abc")),),
];



