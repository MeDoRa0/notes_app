import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.white,
    );
  }
}

class ColorsListview extends StatelessWidget {
  const ColorsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //40 because the radius of circle is 20, so 20*2=40
      height: 40,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ColorItem();
        },
      ),
    );
  }
}
