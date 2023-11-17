import 'package:flutter/material.dart';
import 'package:hotstar/Models/malayalam_movie_model.dart';
import 'package:hotstar/Models/south_indian.dart';
import 'package:hotstar/Models/tense_model.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/Screens/downloads_page.dart';
import 'package:hotstar/Screens/home_page.dart';
import 'package:hotstar/Screens/new_hot.dart';
import 'package:hotstar/Screens/profile_page.dart';
import 'package:hotstar/Screens/search_page.dart';

class NavigatePageScreen extends StatefulWidget {
  const NavigatePageScreen({
    super.key,
    this.southIndian,
    this.trendingMovies,
    this.upcomingData,
    this.malayalamMovieModel,
    this.tamilMovies,
    this.tensedata,
  });
  final SouthIndian? southIndian;
  final TrendingMovies? trendingMovies;
  final UpcomingModel? upcomingData;
  final MalayalamMovieModel? malayalamMovieModel, tamilMovies;
  final TenseMovieModel? tensedata;

  @override
  State<NavigatePageScreen> createState() => _NavigatePageScreenState();
}

class _NavigatePageScreenState extends State<NavigatePageScreen> {
  int _selectedIndex = 0;
  Widget _buildPage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage(
          southIndian: widget.southIndian,
          trendingMovies: widget.trendingMovies,
          upcomingModel: widget.upcomingData,
          malayalamMovieModel: widget.malayalamMovieModel,
          tamilMovies: widget.tamilMovies,
          tensedata: widget.tensedata,
        );
      case 1:
        return SearchPage(
          movies: widget.trendingMovies ?? TrendingMovies(),
        );
      case 2:
        return NewAndHotPage(
          upcomingModel: widget.upcomingData,
          trendingMovies: widget.trendingMovies,
        );
      case 3:
        return const DownloadsPage();
      case 4:
        return const ProfilePage();

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, //New
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        iconSize: 35,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bolt_outlined), label: "New&Hot"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_outlined), label: "Downloads"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "My Space"),
        ],
      ),
    );
  }
}
