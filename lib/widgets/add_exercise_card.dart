import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class AddExerciseCard extends StatefulWidget {
  const AddExerciseCard({super.key});

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kSubtitleColor,
      ),
    );
  }
}
