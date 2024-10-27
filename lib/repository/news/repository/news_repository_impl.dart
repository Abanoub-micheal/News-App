import 'package:news_application/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_application/repository/news/news_repository_contract.dart';

import '../../../model/news_response.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
  NewsRemoteDataSourceContract newsRemoteDataSource;
  NewsRepositoryImpl(this.newsRemoteDataSource);
  @override
  Future<NewsResponse> getNews(String sourceId) async {
   var response = await newsRemoteDataSource.getNews(sourceId);
  return response;
  }


}
NewsRepositoryContract injectNewsRepository(){
  return NewsRepositoryImpl(injectRemoteDataSource());
}