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

  //methode to add a new equipment to the equipmentList
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //method to remove
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  void addFavEquipment(Equipment equipment) {
    favEquipmentList.add(equipment);
  }

  void removeFavEquipment(Equipment equipment) {
    favEquipmentList.remove(equipment);
  }

  //method to cal the total minui spend
  int calculateTotalMinutesSpend() {
    int totalMinuitesSpend = 0;

    //loot through the exerciseslist and cal the no of minuites
    for (var exercise in exercisesList) {
      totalMinuitesSpend += exercise.noOfMinuites;
    }
    //loot through the eequipment and cal the no of minuites
    for (var equipment in equipmentList) {
      totalMinuitesSpend += equipment.noOfMinuites;
    }
    return totalMinuitesSpend;
  }

  //method to mark an exercise as completed
  void markExerciseAsCompleted(int exerciseId) {
    final exercise = exercisesList.firstWhere(
      (exercise) => exercise.id == exerciseId,
    );
    exercise.completed = true;
    //remove exercise

    removeExercise(exercise);

    totalExercisesCompleted++;
  }

  // method to mark and equipment as handed over
  void markAsHandovered(int equipmentId) {
    final equipment = equipmentList.firstWhere(
      (equipment) => equipment.id == equipmentId,
    );
    equipment.handOvered == true;

    //remove equipment
    removeEquipment(equipment);

    totalequipmentsHandOvered++;
  }
  //method to calculate the total number of calories by the user

  double calculateTotalCaloriesBurned() {
    double totalcaloriesBorned = 0;

    for (var equipment in equipmentList) {
      totalcaloriesBorned += equipment.noOfCalories;
    }

    //convert to totalcaloriesBorned to  value between 0 and 1
    if (totalcaloriesBorned > 0 && totalcaloriesBorned <= 10) {
      totalcaloriesBorned = totalcaloriesBorned / 10;
    }
    if (totalcaloriesBorned > 10 && totalcaloriesBorned <= 100) {
      totalcaloriesBorned = totalcaloriesBorned / 100;
    }
    if (totalcaloriesBorned > 100 && totalcaloriesBorned <= 1000) {
      totalcaloriesBorned = totalcaloriesBorned / 1000;
    }

    return totalcaloriesBorned;
  }
}
