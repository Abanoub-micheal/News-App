import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/repository/news/repository/news_repository_impl.dart';
import 'package:news_application/ui/News/news_view_model_cubit.dart';
import 'package:news_application/ui/article_details/article_content.dart';
import 'package:news_application/ui/article_details/article_item.dart';

class NewsContainer extends StatefulWidget {
 final String sourceId;
   const NewsContainer({super.key,required this.sourceId});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsViewModelCubit viewModel=NewsViewModelCubit(injectNewsRepository());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModelCubit,NewsState>(
        bloc: viewModel,
    builder: (context, state)
    {
      switch (state) {
        case NewsLoading() :
          {
            return const Center(child: CircularProgressIndicator());
          }
        case NewsError() :
          {
            return Column(
              children: [
                Text(state.errMessage),
                ElevatedButton(onPressed: () {
                  viewModel.getListOfArticle(widget.sourceId);
                }, child: const Text('try again'))
              ],
            );
          }
        case NewsSuccess() :
          {
            return ListView.builder(itemCount: state.articleList!.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {
                    Navigator.pushNamed(context, ArticleContent.routeName,
                        arguments: state.articleList![index]);
                  }, child: ArticleItem(article: state.articleList![index]));
                }
            );
          }
      }
    }
    );}
}