import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/api_provider.dart';
import 'package:flutter_news_app/widgets/news_card_skelton.dart';
import 'package:flutter_news_app/widgets/menu_drawer.dart';
import 'package:flutter_news_app/widgets/news_card.dart';
import 'package:flutter_news_app/widgets/notification_button.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  bool isLoading = true;
  List newsList = [];

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  getNewsList() async {
    var temp =
        await Provider.of<ApiProvider>(context, listen: false).getNewsList();
    if ((temp)['status'] == 'ok') {
      setState(() {
        newsList = temp['articles'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        drawer: const MenuDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Image(
              height: 44, image: AssetImage('assets/images/logo.png')),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          actions: const [NotificationButton()],
          leading: Builder(builder: (context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 16, right: 16),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 28,
              ),
              alignment: Alignment.centerLeft,
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
        body: !isLoading
            ? SingleChildScrollView(
                child: Column(children: [
                  for (var a in newsList)
                    NewsCardWidget(
                      newsData: a,
                    ),
                  const SizedBox(
                    height: 50,
                  )
                ]),
              )
            : const NewsCardSkelton(),
      ),
    );
  }
}
