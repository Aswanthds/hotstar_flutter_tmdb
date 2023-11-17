import 'package:flutter/material.dart';
import 'package:hotstar/Models/tense_model.dart';
import 'package:hotstar/Screens/Widgets/home_Screen_widget/latest_home.dart';
import 'package:hotstar/Screens/home_page.dart';
import 'package:hotstar/constants.dart';

class TensedDramaWidget extends StatelessWidget {
  const TensedDramaWidget({
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
            "Top 10 Tensed Dramas",
            style: style1,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return TensedDrama(
                    data: widget.tensedata ?? TenseMovieModel(),
                    // MalayalamMovieModel(results: []),
                    index: index);
              }),
        ),
      ],
    );
  }
}
