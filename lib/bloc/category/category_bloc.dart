import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/data/export_data.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository repository;

  CategoryBloc({@required this.repository}) : super(null);
  CategoryState get initialState => CategoryInitialState();
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategoryEvent) {
      yield CategoryLoadingState();

      try {
        List<Recipe> recipes = await repository.getCategory(event.product);
        yield CategoryLoadedState(recipes: recipes);
      } catch (e) {
        yield CategoryErrorState(message: e.toString());
      }
    }
  }
}
