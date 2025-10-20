import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/constants/responsive.dart';
import 'package:gym_app/data/user_data.dart';
import 'package:gym_app/models/equipment_model.dart';
import 'package:gym_app/models/exercice_model.dart';
import 'package:gym_app/widgets/profile_card.dart';
import 'package:gym_app/widgets/progress_card.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //date and time formetter
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User data
  final userData = user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formatterDay = dayFormat.format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
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
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes Spend: ${userData.calculateTotalMinutesSpend().toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kGradientTopColor,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Total Exercises Completed: ${userData.totalExercisesCompleted.toString()}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Total Equipments Handovered:${userData.totalequipmentsHandOvered.toString()}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Your Exercises",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                //exercises list of the user
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.exercisesList.length,
                  itemBuilder: (context, index) {
                    Exercise userExercise = userData.exercisesList[index];

                    return ProfileCard(
                      taskName: userExercise.exerciseName,
                      taskImageUrl: userExercise.exerciseImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markExerciseAsCompleted(userExercise.id);
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Your Equipments",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                //equipment list of the user
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment userEquipment = userData.equipmentList[index];

                    return ProfileCard(
                      taskName: userEquipment.equipmentName,
                      taskImageUrl: userEquipment.equipmentImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markAsHandovered(userEquipment.id);
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
