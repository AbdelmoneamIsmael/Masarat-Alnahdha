import 'package:masarat_alnahdha/features/categories_info/domain/entities/food_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_full_info_state.dart';

class CategoryFullInfoCubit extends Cubit<CategoryFullInfoState> {
  CategoryFullInfoCubit({required this.food})
    : super(CategoryFullInfoInitial());
  final FoodEntity food;
  List<AdditionList> additions = [
    AdditionList(title: "طماطم", price: 200),
    AdditionList(title: "بصل", price: 300),
    AdditionList(title: "خيار", price: 400),
    AdditionList(title: "فلفل", price: 100),
    AdditionList(title: "ليمون", price: 50),
    AdditionList(title: "شطة", price: 40.33),
  ];

  void toggleAddition(int index, bool va) {
    emit(PrepareCheckBoxState());
    additions[index].isChecked = !additions[index].isChecked;
    emit(ChangeChekboxState());
  }
}

class AdditionList {
  final String title;
  final double price;
  bool isChecked;

  AdditionList({
    required this.title,
    required this.price,
    this.isChecked = false,
  });
}
