import 'package:resto_chain_app/features/branches/data/models/branche_model.dart';
import 'package:resto_chain_app/features/branches/data/services/branches_service.dart';

class BranchesRepository {
  final BranchesService service;

  BranchesRepository(this.service);

  Future<List<BranchModel>> getBranchesByRestaurant({
    required String restaurantId,
  }) {
    return service.getBranchesByRestaurant(restaurantId: restaurantId);
  }
}
