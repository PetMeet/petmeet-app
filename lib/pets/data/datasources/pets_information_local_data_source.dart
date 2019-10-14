import 'package:pet_team/pets/data/models/pet_information_model.dart';

abstract class PetsInformationLocalDataSource {
    Future<List<PetInformationModel>> getPetsInformation();
}