import 'package:flutter/material.dart';

class ArtistInfo extends StatelessWidget {
  const ArtistInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ARTIST",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(146, 169, 165, 165),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Text(
              "Dua Lipa",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 30.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.white,
                  height: 10,
                  width: 10,
                ),
                const Icon(Icons.verified, color: Colors.blue),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: const [
            Text(
              "62,354,659",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Monthly listeners",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
