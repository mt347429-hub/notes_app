import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
  List<Color> colors = [
    Color(0xffD3F6DB),
    Color(0xffA1EF8B),
    Color(0xff5A0B4D),
    Color(0xff772D8B),
    Color(0xff92D5E6),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(colors.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: currentIndex == index
                  ? CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: colors[index],
                        radius: 36,
                      ),
                    )
                  : CircleAvatar(backgroundColor: colors[index], radius: 36),
            ),
          );
        }),
      ),
    );
  }
}
