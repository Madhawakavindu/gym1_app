import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentImageUrl;
  final int noOfMinuites;
  final double noOfCalories;
  final String equipmentDescription;
  final bool isAddEquipment;
  final bool isAddFavEquipment;

  final void Function() toggleAddEquioment;
  final void Function() toggleAddFavEquioment;
  const AddEquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentImageUrl,
    required this.noOfMinuites,
    required this.noOfCalories,
    required this.equipmentDescription,
    required this.toggleAddEquioment,
    required this.isAddEquipment,
    required this.toggleAddFavEquioment,
    required this.isAddFavEquipment,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: kSubtitleColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.equipmentName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.equipmentImageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.equipmentDescription,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kGradientBottomColor,
                        ),
                      ),

                      Text(
                        "Time: ${widget.noOfMinuites.toString()} min and ${widget.noOfCalories.toString()} Calories buried",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kMainPinkColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kMainBoldColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          widget.toggleAddEquioment();
                        },
                        icon: Icon(
                          widget.isAddEquipment ? Icons.remove : Icons.add,
                          size: 30,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kMainBoldColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          widget.toggleAddFavEquioment();
                        },
                        icon: Icon(
                          widget.isAddFavEquipment
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
