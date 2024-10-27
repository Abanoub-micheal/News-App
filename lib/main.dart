import 'package:flutter/material.dart';
import 'package:news_application/my_theme.dart';
import 'package:news_application/ui/article_details/article_content.dart';
import 'package:news_application/ui/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context)=>const HomeScreen(),
        ArticleContent.routeName:(context)=>const ArticleContent()
      },
      theme:MyTheme.lightTheme    );
  }
}

