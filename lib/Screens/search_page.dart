import "package:flutter/material.dart";
import "package:hotstar/Models/caller_functions.dart.dart";
import "package:hotstar/Models/searchmodel.dart";
import "package:hotstar/Models/trending.dart";
import "package:hotstar/functions/api_end.dart";

class SearchPage extends StatefulWidget {
  final TrendingMovies movies;
  const SearchPage({super.key, required this.movies});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  bool _isSearching = false;
  List<SearchResult>? _searchResults = [];
  bool _isLoading = false;

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _isLoading = true;
        getdata(_searchQuery);
      } else {
        _isLoading = false;
        _searchResults = [];
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchQuery = '';
      _searchResults = [];
    });
  }

  getdata(String query) async {
    final results = await CallHelperFunctions.getSearchResults(query);
    setState(() {
      _isLoading = false;
      if (results != null) {
        _searchResults = results
            .where((result) =>
                result.title?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
      } else {
        _searchResults = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(
              textStyle: const MaterialStatePropertyAll(
                TextStyle(color: Colors.black),
              ),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              leading: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onChanged: _updateSearchQuery,
              hintText: "Movies, shows and more",
              hintStyle: const MaterialStatePropertyAll(
                TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: [
                const Icon(
                  Icons.keyboard_voice_outlined,
                  color: Colors.black,
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearSearch,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  if (_isSearching && _searchResults != null)
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final result = _searchResults![index];
                          return ListTile(
                            title: Text("${result.title}"),
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: result.backdropPath != null
                                  ? Image.network(
                                      '${ApiEndPoints.imageAppendUrl}{result.backdropPath}',
                                    )
                                  : Container(
                                      color: Colors.black,
                                    ),
                            ),
                          );
                        },
                        childCount: _searchResults?.length,
                      ),
                    )
                  else if (!_isSearching)
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${ApiEndPoints.imageAppendUrl}${widget.movies.results?[index].posterPath}'))),
                              ),
                            );
                          },
                          childCount: 20,
                        ),
                      ),
                    ),
                  if (_isSearching &&
                      _searchResults != null &&
                      _searchResults!.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: Text('No results found.'),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
