import 'package:gym_app/models/equipment_model.dart';
import 'package:gym_app/models/exercice_model.dart';

class User {
  final String userId;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExercisesCompleted = 0;
  int totalequipmentsHandOvered = 0;

  final List<Exercise> exercisesList;
  final List<Equipment> equipmentList;

  final List<Exercise> favExercisesList;
  final List<Equipment> favEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exercisesList,
    required this.equipmentList,
    required this.favExercisesList,
    required this.favEquipmentList,
  });

  // methodes

  //methode to add new exer to the exeList

  void addExercise(Exercise exercise) {
    exercisesList.add(exercise);
  }
}
