// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/constants.dart';
import 'package:hotstar/functions/api_end.dart';
import 'package:hotstar/functions/functions.dart';

class LatestReleases extends StatefulWidget {
  final TrendingMovies? trendingMovies;
  const LatestReleases({super.key, this.trendingMovies});

  @override
  State<LatestReleases> createState() => _LatestReleasesState();
}

class _LatestReleasesState extends State<LatestReleases> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => LatestReleasesWidget(
          trendingMovies: widget.trendingMovies, index: index),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(
        height: 40,
      ),
    );
  }
}

class LatestReleasesWidget extends StatefulWidget {
  final TrendingMovies? trendingMovies;
  final int index;
  const LatestReleasesWidget({
    super.key,
    this.trendingMovies,
    required this.index,
  });

  @override
  State<LatestReleasesWidget> createState() => _LatestReleasesWidgetState();
}

class _LatestReleasesWidgetState extends State<LatestReleasesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            image: DecorationImage(
              image: NetworkImage(
                  '${ApiEndPoints.imageAppendUrl}${widget.trendingMovies!.results?[widget.index].backdropPath}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 10,
              bottom: 5,
            ),
            child: Text(
              widget.trendingMovies!.results?[widget.index].title ?? '',
              style: style1,
            )),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 10,
          ),
          child: Text(
            "Released on : ${Functions.formatDate((widget.trendingMovies!.results?[widget.index].releaseDate).toString())}",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 0,
            left: 10,
            right: 10,
          ),
          child: Text(
            widget.trendingMovies!.results?[widget.index].overview ?? '',
            textAlign: TextAlign.justify,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 40,
                      ),
                      Text(
                        "Watch now",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
