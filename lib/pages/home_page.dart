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
                                  " A warmup is the essential first phase of any physical activity, consisting of light-to-moderate dynamic movements that gradually prepare your body and mind for more intense exercise. It systematically increases your heart rate, body temperature, and blood flow to the muscles, reducing the risk of injury and improving overall performance.",
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
                                  " A warmup is the essential first phase of any physical activity, consisting of light-to-moderate dynamic movements that gradually prepare your body and mind for more intense exercise. It systematically increases your heart rate, body temperature, and blood flow to the muscles, reducing the risk of injury and improving overall performance.",
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
                                  " A warmup is the essential first phase of any physical activity, consisting of light-to-moderate dynamic movements that gradually prepare your body and mind for more intense exercise. It systematically increases your heart rate, body temperature, and blood flow to the muscles, reducing the risk of injury and improving overall performance.",
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
