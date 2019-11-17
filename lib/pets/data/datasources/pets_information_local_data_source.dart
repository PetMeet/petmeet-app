import 'package:flutter/foundation.dart';
import 'package:pet_team/pets/data/models/pet_information_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';


abstract class PetsInformationLocalDataSource {
    Future<List<PetInformationModel>> getPetsInformation();
}

class PetsInformationLocalDataSourceImpl implements PetsInformationLocalDataSource {
  
  PetsInformationLocalDataSourceImpl();

  @override
  Future<List<PetInformationModel>> getPetsInformation() async {
    List<PetInformationModel> petList = new List<PetInformationModel>();
    List<dynamic> petsJson = json.decode(await rootBundle.loadString("assets/jsons/pets_information.json"));
    petList = petsJson.map((i)=>PetInformationModel.fromJson(i)).toList();
    return petList; 
  }
}