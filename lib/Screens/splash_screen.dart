import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotstar/Models/caller_functions.dart.dart';
import 'package:hotstar/Models/malayalam_movie_model.dart';
import 'package:hotstar/Models/south_indian.dart';
import 'package:hotstar/Models/tense_model.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/Screens/nav_page.dart';
import 'package:hotstar/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SouthIndian? southIndian;
  TrendingMovies? trendingMovies;
  UpcomingModel? upcomingData;
  MalayalamMovieModel? malayalamMovieModel, tamilMovies;
  TenseMovieModel? tensedata;
  @override
  void initState() {
    super.initState();
    helperFunctions();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigatePageScreen(
            southIndian: southIndian,
            trendingMovies: trendingMovies,
            upcomingData: upcomingData,
            malayalamMovieModel: malayalamMovieModel,
            tamilMovies: tamilMovies,
            tensedata: tensedata,
          ),
        ),
      ),
    );
  }

  helperFunctions() async {
    southIndian = await CallHelperFunctions.getData();
    trendingMovies = await CallHelperFunctions.getTrendingData();
    upcomingData = await CallHelperFunctions.getUpcomingData();
    malayalamMovieModel = await CallHelperFunctions.getMalayalamMovies();
    tamilMovies = await CallHelperFunctions.getTamilMovies();
    tensedata = await CallHelperFunctions.getTenseDramas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 20, 124, 1.0),
      body: Center(
        child: Image.asset(
          splash,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
