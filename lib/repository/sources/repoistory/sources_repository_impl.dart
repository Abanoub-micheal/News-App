import 'package:news_application/model/source_response.dart';
import 'package:news_application/repository/sources/data_source/sources_remote_data_source_impl.dart';
import 'package:news_application/repository/sources/sources_repository_contract.dart';

class SourcesRepositoryImpl implements SourcesRepositoryContract{
  SourcesRemoteDataSourceContract remoteDataSource;
  SourcesRepositoryImpl(this.remoteDataSource);
  @override
  Future<SourceResponse?>getSourcesByCategoryId(String categoryId) {
    return remoteDataSource.getSourcesByCategoryId(categoryId);
  }

}

SourcesRepositoryContract injectSourceRepository(){

  return SourcesRepositoryImpl(injectSourceRemoteDataSource());
}