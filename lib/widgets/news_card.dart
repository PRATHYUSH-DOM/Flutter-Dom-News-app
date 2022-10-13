import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/news_details.dart';
import 'package:flutter_news_app/widgets/lazy_load_image.dart';

class NewsCardWidget extends StatelessWidget {
  final Map? newsData;
  const NewsCardWidget({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return NewsDetailsScreen(
                    newsData: newsData!,
                  );
                },
              ),
            )
          },
          child: Container(
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
                  // offset: Offset(0.0, 0.75),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                LazyLoadImage(
                    url: "${newsData!['urlToImage']}", errorSize: 600),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "${newsData!['title']}",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
