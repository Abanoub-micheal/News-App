import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/api_manager/Api_Manager.dart';
import 'package:news_application/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_application/repository/news/repository/news_repository_impl.dart';
import '../../model/news_response.dart';
import '../../repository/news/news_repository_contract.dart';
part 'news_view_model_state.dart';

class NewsViewModelCubit extends Cubit<NewsState> {
  NewsRepositoryContract newsRepository;
  NewsViewModelCubit(this.newsRepository) : super(NewsLoading(loadingMessage: 'Loading....'));

  getListOfArticle(String sourceId)async{
    try {
      emit(NewsLoading(loadingMessage: 'Loading...'));
      var response=await newsRepository.getNews(sourceId);
      if(response.status=='error'){
          emit(NewsError(errMessage: response.message??''));

        }else{
          emit(NewsSuccess(articleList: response.articles));

        }
    } catch (e) {
      emit(NewsError(errMessage: e.toString()));
    }


  }

}
