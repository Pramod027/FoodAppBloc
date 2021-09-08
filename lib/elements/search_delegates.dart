import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodappbloc/bloc/search/export_search.dart';
import 'package:foodappbloc/elements/elements_export.dart';

class FoodSearch extends SearchDelegate<List> {
  SearchBloc searchBloc;
  FoodSearch({@required this.searchBloc});
  String queryString;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    // searchBloc.add(SearchEventClass(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is SearchUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return Center(
            child: Text('Failed To Load'),
          );
        }
        if (state is SearchLoaded) {
          if (state.recipes.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.fit(1);
                  },
                  itemCount: state.recipes.length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SearchItemCart(
                      pressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             FoodDetails(items: state.recipes[index])));
                        Navigator.pushNamed(context, '/foodDetails',
                            arguments: state.recipes[index]);
                      },
                      imageUrl: state.recipes[index].imageUrl,
                      itemName: state.recipes[index].title,
                    );
                  }));
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    queryString = query;
    searchBloc.add(SearchEventClass(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, SearchState state) {
      if (state is SearchUninitialized) {
        return Center(child: CircularProgressIndicator());
      }
      // if (state is SearchError) {
      //   return Center(
      //     child: Text('Failed To Load'),
      //   );
      // }
      if (state is SearchLoaded) {
        if (state.recipes.isEmpty) {
          return Center(
            child: Text('No Results'),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) {
                return StaggeredTile.fit(1);
              },
              itemCount: state.recipes.length,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SearchItemCart(
                  imageUrl: state.recipes[index].imageUrl,
                  itemName: state.recipes[index].title,
                  pressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             FoodDetails(items: state.recipes[index])));
                    Navigator.pushNamed(context, '/foodDetails',
                        arguments: state.recipes[index]);
                  },
                );
              }),
        );
      }
      return Container();
    });
  }
}
