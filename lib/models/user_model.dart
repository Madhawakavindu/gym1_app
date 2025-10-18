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

  final List<Exercise> favExerciseList;
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
    required this.favExerciseList,
    required this.favEquipmentList,
  });

  // methodes

  //methode to add new exer to the exeList

  void addExercise(Exercise exercise) {
    exercisesList.add(exercise);
  }

  void removeExercise(Exercise exercise) {
    exercisesList.remove(exercise);
  }

  //method to add new fav
  void addFavExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  //method to remove fav
  void removeFavExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }
}
