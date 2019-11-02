import 'package:pet_team/pets/data/models/pet_information_model.dart';

abstract class PetsInformationLocalDataSource {
    Future<List<PetInformationModel>> getPetsInformation();
}

class PetsInformationLocalDataSourceImpl implements PetsInformationLocalDataSource {
  
  PetsInformationLocalDataSourceImpl();

  @override
  Future<List<PetInformationModel>> getPetsInformation() {
    return null;
  }
}