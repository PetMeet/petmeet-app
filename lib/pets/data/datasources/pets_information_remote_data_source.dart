import 'package:flutter/cupertino.dart';
import 'package:pet_team/pets/data/models/pet_information_model.dart';

import 'package:http/http.dart' as http;

abstract class PetsInformationRemoteDataSource {
    Future<List<PetInformationModel>> getPetsInformation();
}

class PetsInformationRemoteDataSourceImpl implements PetsInformationRemoteDataSource {
  
  final http.Client client;

  PetsInformationRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<PetInformationModel>> getPetsInformation() {
    return null;
  }
}