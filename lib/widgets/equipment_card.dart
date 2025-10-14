import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentImageUrl;
  final int noOfMinuites;
  final double noOfCalories;
  const EquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentImageUrl,
    required this.noOfMinuites,
    required this.noOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(equipmentImageUrl, fit: BoxFit.cover, width: 100),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${noOfMinuites.toString()} Of Workout.",
                      style: const TextStyle(
                        color: kMainRedColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${noOfCalories.toString()} Calories Burned.",
                      style: const TextStyle(
                        color: kMainRedColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
