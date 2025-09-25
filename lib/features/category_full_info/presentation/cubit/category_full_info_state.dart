part of 'category_full_info_cubit.dart';

abstract class CategoryFullInfoState extends Equatable {
  const CategoryFullInfoState();

  @override
  List<Object> get props => [];
}

class CategoryFullInfoInitial extends CategoryFullInfoState {}
class PrepareCheckBoxState extends CategoryFullInfoState {}
class ChangeChekboxState extends CategoryFullInfoState {}
