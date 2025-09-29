class Equipment {
  final int id;
  final String equipmentName;
  final String equipmentImageUrl;
  final int noOfMinuites;
  final double noOfCalories;
  final bool handOvered;

  Equipment({
    required this.id,
    required this.equipmentName,
    required this.equipmentImageUrl,
    required this.noOfMinuites,
    required this.noOfCalories,
    required this.handOvered,
    required String equipmentDescription,
  });
}
