import '../../../model/source.dart';

sealed class SourceState{}
class SourceLoadingState extends SourceState{}
class SourceErrorState extends SourceState{
final  String? errMessage;
  SourceErrorState({required this.errMessage});
}
class SourceSuccessState extends SourceState{
 final List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}
