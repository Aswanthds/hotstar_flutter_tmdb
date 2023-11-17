import 'package:flutter/material.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/latest_home.dart';
import 'package:hotstar/Screens/home_page.dart';
import 'package:hotstar/constants.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Upcoming Movies",
            style: style1,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return LatestHomeTrending(
                    data: widget.upcomingModel ?? UpcomingModel(),
                    index: index);
              }),
        ),
      ],
    );
  }
}
