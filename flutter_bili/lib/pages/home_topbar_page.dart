import 'package:flutter/material.dart';
import 'package:flutter_bili/http/dao/news_List_dao.dart';
import 'package:flutter_bili/widget/hi_banner.dart';
import 'package:flutter_bili/model/news_model.dart';

class HomeTopBarPage extends StatefulWidget {
  final int? itemIndex;
  const HomeTopBarPage(this.itemIndex, {Key? key}) : super(key: key);
  @override
  State<HomeTopBarPage> createState() => _HomeTopBarPageState();
}

class _HomeTopBarPageState extends State<HomeTopBarPage> {

  List<Items>? bannerList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(context: context,
          removeTop: true,
          child: ListView(
            children: [
              if((bannerList != null) && (widget.itemIndex == 0) ) _banner(),



            ],
          )
        );
  }

  _banner()  {
      return Padding(padding: const EdgeInsets.only(left: 8, right: 8),
        child: HiBanner(bannerList),
      );
  }

  void loadData() async {
    try {
      NewsListModel newModel = await NewsListDao.getNewsListData();
      int count = newModel.block?.length ?? 0 ;
      List<Items> bannerArray = [];


      print("-------------------");

      for (int i = 0; i < count; i ++) {
          var model = newModel.block?[i];
          if (model?.templateStyle == 1101) {
            bannerArray = model?.items ?? [];
          }
      }
      setState(() {
        bannerList = bannerArray ;
      });

    }catch (e){
      print("-----错误----$e");
    }

  }

}
