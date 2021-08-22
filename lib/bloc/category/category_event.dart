import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {}

class FetchCategoryEvent extends CategoryEvent {
  final String product;

  FetchCategoryEvent({this.product});

  @override
  // TODO: implement props
  List<Object> get props => [product];
}
