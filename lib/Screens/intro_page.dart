import 'package:flutter/material.dart';
import 'package:hotstar/Screens/Widgets/intro_text.dart';
import 'package:hotstar/Screens/nav_page.dart';
import 'package:hotstar/constants.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            Image.asset(
              intro,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.sizeOf(context).width - 20,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black87,
                      Colors.black87,
                      Colors.transparent
                    ],
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: IntroTextWidget(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // getData();
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    const NavigatePageScreen(),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(1, 20, 124, 1.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 120),
                              child: Text(
                                "Continue >",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.g_translate,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Change App Language",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
