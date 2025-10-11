import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/constants/responsive.dart';
import 'package:gym_app/data/equipment_data.dart';
import 'package:gym_app/data/exercise_data.dart';
import 'package:gym_app/data/user_data.dart';

import 'package:gym_app/pages/exercise_details_page.dart';
import 'package:gym_app/widgets/exercise_card.dart';
import 'package:gym_app/widgets/progress_card.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //date and time formetter
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User data
  final userData = user;

  //exercise and equipment data
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formatterDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  "${userData.fullName}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: kMainColor,
                  ),
                ),
                const SizedBox(height: 20),
                ProgressCard(progressValue: 0.5, total: 100),
                const SizedBox(height: 20),

                const Text(
                  "Today's Activity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Warmup",
                              exerciseDesciption:
                                  "The Warm-Up page helps users prepare their body before starting a workout. It includes light exercises designed to increase blood flow, loosen muscles, and reduce the risk of injury. Each warm-up routine is short, easy to follow, and can be done anywhere.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        description: "see more...",
                        imageUrl: "assets/images/exercises/downward.png",
                        title: "Warmup",
                      ),
                    ),
                    ExerciseCard(
                      description: "see more...",
                      imageUrl: "assets/images/equipments/dumbbells2.png",
                      title: "Equipment",
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Exercise",
                              exerciseDesciption:
                                  "The Exercise page is the main section of the app where users can view and perform different workouts. It provides detailed information about each exercise to help users improve strength, fitness, and flexibility.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        description: "see more...",
                        imageUrl: "assets/images/exercises/triangle.png",
                        title: "Exercise",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Streching",
                              exerciseDesciption:
                                  " The Stretching page helps users cool down and relax their muscles after a workout. It includes different stretching routines to improve flexibility, reduce muscle stiffness, and prevent soreness.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        description: "see more...",
                        imageUrl: "assets/images/exercises/dragging.png",
                        title: "Stretching",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
