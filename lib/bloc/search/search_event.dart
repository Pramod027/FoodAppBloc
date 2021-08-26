import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {}

class SearchEventClass extends SearchEvent {
  final String query;

  SearchEventClass({this.query});

  @override
  // TODO: implement props
  List<Object> get props => [];
}
