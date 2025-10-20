import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/constants/responsive.dart';
import 'package:gym_app/data/equipment_data.dart';
import 'package:gym_app/data/exercise_data.dart';
import 'package:gym_app/data/user_data.dart';
import 'package:gym_app/models/equipment_model.dart';
import 'package:gym_app/models/exercice_model.dart';
import 'package:gym_app/widgets/add_equipment_card.dart';
//import 'package:gym_app/widgets/add_exercise_card.dart';
import 'package:gym_app/widgets/add_exercise_card.dart';
import 'package:gym_app/widgets/equipment_card.dart';
//import 'package:gym_app/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //imort the user from user data
  final userData = user;

  //exercise list
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello , ${userData.fullName}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 25),
                const Text(
                  "Lets Add Some Woekouts and Euipment for today!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kMainBrownColor,
                  ),
                ),
                SizedBox(height: 25),
                const Text(
                  "All Exercises",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 15),
                //list view to scroll horizontally
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exerciseList[index];
                      return AddExerciseCard(
                        exerciseTitle: exercise.exerciseName,
                        exerciseImageUrl: exercise.exerciseImageUrl,
                        noOfMinutes: exercise.noOfMinuites,
                        isAdded: userData.exercisesList.contains(exercise),
                        isFavourited: userData.favExerciseList.contains(
                          exercise,
                        ),

                        toggleAddExercise: () {
                          setState(() {
                            if (userData.exercisesList.contains(exercise)) {
                              userData.removeExercise(exercise);
                              print(userData.exercisesList.length);
                            } else {
                              userData.addExercise(exercise);
                              print(userData.exercisesList.length);
                            }
                          });
                        },
                        toggleAddFavExercise: () {
                          setState(() {
                            if (userData.favExerciseList.contains(exercise)) {
                              userData.removeFavExercise(exercise);
                              print(userData.favExerciseList.length);
                            } else {
                              userData.addFavExercise(exercise);
                              print(userData.favExerciseList.length);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                const Text(
                  "All Equipments",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 15),

                //list view the scroll
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: equipmentList.length,
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];

                      return AddEquipmentCard(
                        equipmentName: equipment.equipmentName,
                        equipmentImageUrl: equipment.equipmentImageUrl,
                        noOfMinuites: equipment.noOfMinuites,
                        noOfCalories: equipment.noOfCalories,
                        equipmentDescription: equipment.equipmentDescription,
                        isAddEquipment: userData.equipmentList.contains(
                          equipment,
                        ),
                        isAddFavEquipment: userData.favEquipmentList.contains(
                          equipment,
                        ),

                        toggleAddEquioment: () {
                          setState(() {
                            if (userData.equipmentList.contains(equipment)) {
                              userData.removeEquipment(equipment);
                            } else {
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        toggleAddFavEquioment: () {
                          setState(() {
                            if (userData.favEquipmentList.contains(equipment)) {
                              userData.removeFavEquipment(equipment);
                            } else {
                              userData.addFavEquipment(equipment);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
