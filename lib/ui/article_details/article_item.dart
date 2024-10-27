import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/model/news_response.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(article.publishedAt ?? '');
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: article.urlToImage ?? '',
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.author ?? '',
            style: const TextStyle(
                color: Color(0x54353232),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
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
        ],
      ),
    );
  }
}
