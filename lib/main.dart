import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/api_provider.dart';
import 'package:flutter_news_app/screens/news_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        key: widget.key,
        providers: [
          ChangeNotifierProvider<ApiProvider>(
            create: (context) => ApiProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: const Color(0XFFfA3454),
              secondaryHeaderColor: const Color.fromARGB(255, 151, 12, 130)),
          home: const NewsListScreen(),
        ));
  }
}
