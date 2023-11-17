import 'package:flutter/material.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/constants.dart';
import 'package:hotstar/functions/api_end.dart';

List<String> images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
  "https://wallpaperaccess.com/full/2637581.jpg"
];

class CarouselWidget extends StatefulWidget {
  final TrendingMovies movies;
  const CarouselWidget({super.key, required this.movies});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activePage = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    List<String?> images = [
      widget.movies.results![0].backdropPath,
      widget.movies.results![1].backdropPath,
      widget.movies.results![2].backdropPath,
      widget.movies.results![3].backdropPath,
      widget.movies.results![4].backdropPath,
    ];
    List<String?> images2 = [
      widget.movies.results![0].posterPath,
      widget.movies.results![1].posterPath,
      widget.movies.results![2].posterPath,
      widget.movies.results![3].posterPath,
      widget.movies.results![4].posterPath,
    ];
    return Wrap(
      spacing: 0,
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width * 3,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                '${ApiEndPoints.imageAppendUrl}${images2[pagePosition]}',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 40,
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                (widget.movies.results![pagePosition]
                                        .voteAverage)!
                                    .round()
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                                size: 30,
                              ),
                              Text(
                                ('From ${widget.movies.results![pagePosition].voteCount} votes'),
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
        container(context),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.white24,
          shape: BoxShape.circle),
    );
  });
}

Widget container(BuildContext context) => SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 35,
                    ),
                    Text(
                      "Watch",
                      style: style2,
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 35,
                )),
          ),
        ],
      ),
    );
