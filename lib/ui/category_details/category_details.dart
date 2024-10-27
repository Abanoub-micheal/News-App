import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/model/category_dm.dart';
import 'package:news_application/repository/sources/repoistory/sources_repository_impl.dart';
import 'package:news_application/ui/category_details/category_details_view_model.dart';
import 'package:news_application/ui/category_details/category_details_states.dart';
import 'package:news_application/ui/category_details/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  const CategoryDetails({super.key, required this.category});
 final CategoryDm category;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel =CategoryDetailsViewModel(injectSourceRepository());
  @override
  void initState() {
    super.initState();
    viewModel.getSourcesByCategoryId(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel,SourceState>(
      bloc: viewModel,
      builder: (context, state) {
        switch(state){
          case SourceLoadingState():{
           return const Center(child: CircularProgressIndicator());

          }
          case SourceErrorState():{
        return Column(
            children: [
               Text(state.errMessage??''),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getSourcesByCategoryId(widget.category.id);
                  },
                  child: const Text('try again'))
            ],
          );
          }
          case SourceSuccessState():{
            return TabContainer(sourceList: state.sourcesList);
          }
        }
    },);
  }
}
