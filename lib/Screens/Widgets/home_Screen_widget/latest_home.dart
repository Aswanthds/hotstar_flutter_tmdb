import 'package:flutter/material.dart';
import 'package:hotstar/Models/malayalam_movie_model.dart';
import 'package:hotstar/Models/south_indian.dart';
import 'package:hotstar/Models/tense_model.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/functions/api_end.dart';

class LatestHome extends StatelessWidget {
  final SouthIndian data;
  final int index;
  const LatestHome({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    '${ApiEndPoints.imageAppendUrl}${data.results?[index].posterPath}'),
                fit: BoxFit.fitWidth)),
      ),
    );
  }
}

class LatestHomeMalayalam extends StatelessWidget {
  final MalayalamMovieModel? data;
  final int? index;
  const LatestHomeMalayalam(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    '${ApiEndPoints.imageAppendUrl}${data?.results![index ?? 0].posterPath}'),
                // NetworkImage('$imageAppendUrl${data.results?[index].posterPath}')
                fit: BoxFit.fitWidth)),
      ),
    );
  }
}

class LatestHomeTrending extends StatelessWidget {
  final UpcomingModel data;
  final int index;
  const LatestHomeTrending(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    '${ApiEndPoints.imageAppendUrl}${data.results?[index].posterPath}'),
                fit: BoxFit.fitWidth)),
      ),
    );
  }
}

class Top10Movies extends StatelessWidget {
  final int index;
  final TrendingMovies data;
  const Top10Movies({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              height: 220,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        '${ApiEndPoints.imageAppendUrl}${data.results![index].posterPath}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 0,
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..strokeWidth = 10.0
                    ..color = Colors.blue.shade800
                    ..style = PaintingStyle.fill,
                  decorationStyle: TextDecorationStyle.double),
            ),
          ),
        ],
      ),
    );
  }
}

class TensedDrama extends StatelessWidget {
  final int index;
  final TenseMovieModel data;
  const TensedDrama({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              height: 220,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        '${ApiEndPoints.imageAppendUrl}${data.results![index].posterPath}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 0,
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..strokeWidth = 10.0
                    ..color = Colors.blue.shade800
                    ..style = PaintingStyle.fill,
                  decorationStyle: TextDecorationStyle.double),
            ),
          ),
        ],
      ),
    );
  }
}
