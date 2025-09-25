part of 'categories_info_cubit.dart';

abstract class CategoriesInfoState extends Equatable {
  const CategoriesInfoState();

  @override
  List<Object> get props => [];
}

class CategoriesInfoInitial extends CategoriesInfoState {}
class ChooseImageState extends CategoriesInfoState 
{
  final String image;
  const ChooseImageState(this.image);
  @override
  List<Object> get props => [image];
}
