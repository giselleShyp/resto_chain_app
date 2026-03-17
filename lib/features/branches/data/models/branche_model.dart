import 'package:resto_chain_app/features/branches/data/models/working_hour.dart';

class BranchModel {
  final String id;
  final String restaurantId;
  final String branchName;
  final String location;
  final WorkingHours workingHours;

  const BranchModel({
    required this.id,
    required this.restaurantId,
    required this.branchName,
    required this.location,
    required this.workingHours,
  });

  bool get isOpen => workingHours.isOpenNow();

  factory BranchModel.fromFirestore(
    String id,
    Map<String, dynamic> data,
  ) {
    return BranchModel(
      id: id,
      restaurantId: data['restaurantId'] as String,
      branchName: data['branchName'] as String,
      location: data['location'] as String,
      workingHours: WorkingHours.fromMap(data),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'restaurantId': restaurantId,
      'branchName': branchName,
      'location': location,
      ...workingHours.toMap(),
    };
  }
}
