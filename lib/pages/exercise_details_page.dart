import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/models/exercice_model.dart';
import 'package:intl/intl.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDesciption;
  final List<Exercise> exerciseList;
  const ExerciseDetailsPage({
    super.key,
    required this.exerciseTitle,
    required this.exerciseDesciption,
    required this.exerciseList,
  });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  //date and time formetter
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formatterDay = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "$formattedDate $formatterDay",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kSubtitleColor,
              ),
            ),
            Text(
              widget.exerciseTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: kMainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
