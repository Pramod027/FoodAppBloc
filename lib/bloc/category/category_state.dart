import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodappbloc/data/model/food.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitialState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {
  List<Recipe> recipes;
  CategoryLoadedState({@required this.recipes});
  @override
  List<Object> get props => null;
}

class CategoryErrorState extends CategoryState {
  String message;
  CategoryErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
