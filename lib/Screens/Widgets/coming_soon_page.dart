import 'package:flutter/material.dart';
import 'package:hotstar/Models/upcoming_model.dart';
import 'package:hotstar/Screens/Widgets/coming_soon_widget.dart';

class ComingSoonPage extends StatefulWidget {
  final UpcomingModel? upcomingModel;
  const ComingSoonPage({super.key, this.upcomingModel});

  @override
  State<ComingSoonPage> createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          ComingSoonWidget(index: index, upcomingModel: widget.upcomingModel),
      itemCount: widget.upcomingModel?.results?.length ?? 0,
      separatorBuilder: (context, index) => const SizedBox(
        height: 40,
      ),
    );
  }
}
