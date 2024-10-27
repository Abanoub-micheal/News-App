import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/news_response.dart';

class ArticleContent extends StatelessWidget {
  static const String routeName = 'article-content';
  const ArticleContent({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    DateTime date = DateTime.parse(article.publishedAt ?? '');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50,),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageUrl: article.urlToImage ?? '',
                  )),
              const SizedBox(
                height:10,
              ),
              Text(
                article.author ?? '',
                style: const TextStyle(
                    color: Color(0x54353232),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                article.title ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(DateFormat("dd-mm-yyyy").format(date),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      color: Color(0x54353232),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              Text(DateFormat("hh:mm").format(date),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      color: Color(0x54353232),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 40,
              ),
              Text(article.content ?? '',style: const TextStyle(fontSize: 18),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => article.url, child: const Text('View Full Article',textAlign: TextAlign.end,)),
                  const Icon(Icons.arrow_right)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
