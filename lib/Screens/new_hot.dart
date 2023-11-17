import 'package:flutter/material.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/Screens/Widgets/coming_soon_page.dart';
import 'package:hotstar/Screens/Widgets/latest_releases_tile.dart';

class NewAndHotPage extends StatefulWidget {
  final UpcomingModel? upcomingModel;
  final TrendingMovies? trendingMovies;
  const NewAndHotPage({super.key, this.upcomingModel, this.trendingMovies});

  @override
  State<NewAndHotPage> createState() => _NewAndHotPageState();
}

class _NewAndHotPageState extends State<NewAndHotPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Latest Releases"),
              ),
              Tab(
                child: Text("Coming Soon"),
              ),
            ]),
          ),
        ),
        body: TabBarView(children: [
           LatestReleases(trendingMovies: widget.trendingMovies),
          ComingSoonPage(upcomingModel: widget.upcomingModel),
        ]),
      ),
    );
  }
}
