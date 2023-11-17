import 'package:flutter/material.dart';
import 'package:hotstar/constants.dart';

class IntroTextWidget extends StatelessWidget {
  const IntroTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          splash,
          height: 80,
          width: 80,
        ),
        const Text(
          intoHeading,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          introAge,
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(
                marveLogo,
                height: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                hotstarpecials,
                height: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.network(
                natGeo,
                height: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                star,
                height: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.network(
                pixar,
                height: 18,
              ),
              const SizedBox(
                width: 15,
              ),
              Image.network(
                starWars,
                height: 20,
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
