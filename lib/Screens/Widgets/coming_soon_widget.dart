import 'package:flutter/material.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/constants.dart';
import 'package:hotstar/functions/api_end.dart';
import 'package:hotstar/functions/functions.dart';

class ComingSoonWidget extends StatefulWidget {
  final UpcomingModel? upcomingModel;
  final int index;
  const ComingSoonWidget({
    super.key,
    this.upcomingModel,
    required this.index,
  });

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
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
                  '${ApiEndPoints.imageAppendUrl}${widget.upcomingModel!.results?[widget.index].backdropPath}'),
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
            widget.upcomingModel?.results?[widget.index].title ?? '',
            style: style1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
          ),
          child: Text(
            "Releasing on ${Functions.formatDate((widget.upcomingModel?.results?[widget.index].releaseDate).toString())}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 10,
            ),
            child: Text(
              '${widget.upcomingModel?.results?[widget.index].overview}',
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 65,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 30,
                  ),
                  const Text(
                    "Remind Me",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      Functions.formatDate((widget.upcomingModel
                              ?.results?[widget.index].releaseDate)
                          .toString()),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
