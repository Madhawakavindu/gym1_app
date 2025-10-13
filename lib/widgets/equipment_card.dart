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
    );
  }
}
