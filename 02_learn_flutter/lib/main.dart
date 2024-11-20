import 'package:flutter/material.dart';
import '07_动画/03_显式动画/06_动画过渡组件/02_Flutter预置的动画过渡组件.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ZMJHomePage(),
    );
  }
}

class ZMJHomePage extends StatelessWidget {
  const ZMJHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: const AnimatedWidgetsTest(),
    );
  }
}




// https://blog.csdn.net/nonagontech/article/details/141230085
// https://blog.csdn.net/haoxuhong/article/details/112463005

// https://blog.csdn.net/cmwly/article/details/127209041?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-127209041-blog-128582374.235^v43^pc_blog_bottom_relevance_base9&spm=1001.2101.3001.4242.1&utm_relevant_index=3


/*
底层原理：
重要：
  https://download.csdn.net/blog/column/11434139/121416161#SchedulerBinding_179

  https://www.ucloud.cn/yun/89633.html
*/ 