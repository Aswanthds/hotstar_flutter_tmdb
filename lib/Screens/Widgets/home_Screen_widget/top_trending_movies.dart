import 'package:flutter/material.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/latest_home.dart';
import 'package:hotstar/Screens/home_page.dart';
import 'package:hotstar/constants.dart';

class TopTrendingMovies extends StatefulWidget {
  const TopTrendingMovies({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  State<TopTrendingMovies> createState() => _TopTrendingMoviesState();
}

class _TopTrendingMoviesState extends State<TopTrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Top 10 Trending Movies",
            style: style1,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Top10Movies(
                data: widget.widget.trendingMovies ?? TrendingMovies(), index: index),
          ),
        ),
      ],
    );
  }
}
