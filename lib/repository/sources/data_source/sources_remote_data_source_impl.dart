import 'package:news_application/api_manager/Api_Manager.dart';
import '../../../model/source_response.dart';
import '../sources_repository_contract.dart';

class SourcesRemoteDataSourceImpl implements SourcesRemoteDataSourceContract {
  ApiManager apiManager;
  SourcesRemoteDataSourceImpl(this.apiManager);

  @override
Future<SourceResponse> getSourcesByCategoryId(String categoryId)async {
   var response= await  apiManager.getSources(categoryId);
   return response;
  }
}
SourcesRemoteDataSourceContract injectSourceRemoteDataSource(){
  return SourcesRemoteDataSourceImpl(ApiManager.getInstance());
}
