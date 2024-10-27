import 'package:news_application/api_manager/Api_Manager.dart';
import 'package:news_application/repository/news/news_repository_contract.dart';
import '../../../model/news_response.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSourceContract{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl(this.apiManager);
  
  @override
  Future<NewsResponse> getNews(String sourceId) {
   var response= apiManager.getNews(sourceId);
   return response;
  }
}
NewsRemoteDataSourceContract injectRemoteDataSource(){

  return NewsRemoteDataSourceImpl(ApiManager.getInstance());
}
