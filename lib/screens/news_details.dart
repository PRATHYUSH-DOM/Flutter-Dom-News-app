import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/providers/api_provider.dart';
import 'package:flutter_news_app/widgets/lazy_load_image.dart';
import 'package:flutter_news_app/widgets/news_detail_skelton.dart';
import 'package:provider/provider.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsModel newsData;
  const NewsDetailsScreen({super.key, required this.newsData});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  bool isLoading = true;
  String newsContent = '';

  @override
  void initState() {
    getNewsDetails();
    super.initState();
  }

  getNewsDetails() async {
    var temp =
        await Provider.of<ApiProvider>(context, listen: false).getNewsDetails();
    setState(() {
      newsContent = temp;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        // drawer: const MenuDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Image(
              height: 44, image: AssetImage('assets/images/logo.png')),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: !isLoading
            ? SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            LazyLoadImage(
                                url: "${widget.newsData.urlToImage}",
                                errorSize: 600),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: Text(
                          "${widget.newsData.title}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "${widget.newsData.description}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          newsContent.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
              )
            : const NewsDetailSkelton(),
      ),
    );
  }
}
