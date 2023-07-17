import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  //for selected color
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 17,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 20,
            backgroundColor: color,
          );
  }
}

class ColorsListview extends StatefulWidget {
  const ColorsListview({
    super.key,
  });

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int currentIndex = 0;
  //creating list of colors
  List<Color> colors = const [
    Color(0xffcdb4db),
    Color(0xffffc8dd),
    Color(0xffffafcc),
    Color(0xffbde0fe),
    Color(0xffa2d2ff),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //40 because the radius of circle is 20, so 20*2=40
      height: 40,
      child: ListView.builder(
        //this will show the number of colors in list
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //this will enable user to press on color to select it
            child: GestureDetector(
              //this will show the selected color when user press on it
              onTap: () {
                currentIndex = index;
                //setState to update UI and show selected color
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                //this will show the selected color
                //if the index = currentIndex of coloritem then true
                isSelected: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
