import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/api_manager/Api_Manager.dart';
import 'package:news_application/repository/sources/data_source/sources_remote_data_source_impl.dart';
import 'package:news_application/repository/sources/repoistory/sources_repository_impl.dart';
import 'package:news_application/ui/category_details/category_details_states.dart';
import '../../repository/sources/sources_repository_contract.dart';


class CategoryDetailsViewModel extends Cubit<SourceState>{

 SourcesRepositoryContract sourceRepository;


 CategoryDetailsViewModel(this.sourceRepository):super(SourceLoadingState());

getSourcesByCategoryId(String categoryId)async{
try {
 emit(SourceLoadingState());
 var response=await sourceRepository.getSourcesByCategoryId(categoryId);

 if(response.status=='error'){
  emit(SourceErrorState(errMessage: response.message));
  return;
 }
 if(response.message=='ok'){
  emit(SourceSuccessState(sourcesList: response.sources!));
  return;
 }
} catch (e) {
 emit(SourceErrorState(errMessage:'Error Loading list source'));
}


}




}