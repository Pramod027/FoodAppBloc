import 'package:equatable/equatable.dart';
import 'package:foodappbloc/data/export_data.dart';

abstract class SearchState extends Equatable {}

class SearchUninitialized extends SearchState {
  @override
 
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<Recipe> recipes;

  SearchLoaded({this.recipes});
  @override
  List<Object> get props => [recipes];
}

class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}
