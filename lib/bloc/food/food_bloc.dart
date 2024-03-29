import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/bloc/food/food_event.dart';
import 'package:foodappbloc/bloc/food/food_state.dart';
import 'package:foodappbloc/data/model/food.dart';
import 'package:foodappbloc/data/repositories/food_repository.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodRepository repository;

  FoodBloc({@required this.repository}) : super(null);

  FoodState get initialState => FoodInitialState();
  @override
  Stream<FoodState> mapEventToState(FoodEvent event) async* {
    if (event is FetchFoodEvent) {
      yield FoodLoadingState();

      try {
        List<Recipe> recipes = await repository.getFoods();
        yield FoodLoadedState(recipes: recipes);
      } catch (e) {
        yield FoodErrorState(message: e.toString());
      }
    }
  }
}
