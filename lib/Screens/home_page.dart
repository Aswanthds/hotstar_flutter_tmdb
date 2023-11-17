import 'package:flutter/material.dart';
import 'package:hotstar/Models/malayalam_movie_model.dart';
import 'package:hotstar/Models/south_indian.dart';
import 'package:hotstar/Models/tense_model.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/carousel.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/tensed_drama.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/top_trending_movies.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/trending_malayalam.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/trending_south_india.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/trensding_tamil.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/upcoming_movie.dart';
import 'package:hotstar/constants.dart';

class HomePage extends StatefulWidget {
  final SouthIndian? southIndian;
  final TrendingMovies? trendingMovies;
  final UpcomingModel? upcomingModel;
  final MalayalamMovieModel? malayalamMovieModel, tamilMovies;
  final TenseMovieModel? tensedata;
  const HomePage({
    super.key,
    this.southIndian,
    this.trendingMovies,
    this.upcomingModel,
    this.malayalamMovieModel,
    this.tamilMovies,
    this.tensedata,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //helperFunctions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          splash,
          height: 60,
        ),
        actions: [
          Image.asset(
            subscribe,
            height: 25,
          )
        ],
      ),
      body: ListView(children: [
        CarouselWidget(movies: widget.trendingMovies ?? TrendingMovies()),
        TopTrendingMovies(widget: widget),
        UpcomingMoviesList(widget: widget),
        TrendingSouthIndia(widget: widget),
        TrendingMalayalamWidget(widget: widget),
        TrendingTamilWidget(widget: widget),
        TensedDramaWidget(widget: widget),
      ]),
    );
  }
}
