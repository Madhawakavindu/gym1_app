import 'package:gym_app/models/equipment_model.dart';
import 'package:gym_app/models/exercice_model.dart';
import 'package:gym_app/models/user_model.dart';

User user = User(
  userId: "123456",
  fullName: "Hello, Madhawa",
  gender: "male",
  address: "123, main street, city, country",
  age: 24,
  description: "Fitness enthusiast",
  exercisesList: [
    Exercise(
      id: 0,
      exerciseName: "Push Ups",
      exerciseImageUrl: " assets/images/exercises/cobra.png",
      noOfMinuites: 15,
      completed: false,
    ),
    Exercise(
      id: 1,
      exerciseName: "Squats",
      exerciseImageUrl: " assets/images/exercises/downward.png",
      noOfMinuites: 20,
      completed: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of adjustable dumbbells for strength training.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinuites: 5,
      noOfCalories: 2,
      handOvered: false,
    ),
  ],
  favExercisesList: [
    Exercise(
      id: 0,
      exerciseName: "Push Ups",
      exerciseImageUrl: " assets/images/exercises/cobra.png",
      noOfMinuites: 15,
      completed: false,
    ),
  ],
  favEquipmentList: [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of adjustable dumbbells for strength training.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinuites: 5,
      noOfCalories: 2,
      handOvered: false,
    ),
  ],
);
