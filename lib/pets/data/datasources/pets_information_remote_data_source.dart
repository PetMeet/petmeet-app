import 'package:flutter/foundation.dart';
import 'package:pet_team/pets/data/models/pet_information_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import '../models/pet_information_model.dart';

abstract class PetsInformationRemoteDataSource {
    Future<List<PetInformationModel>> getPetsInformation();
}

class PetsInformationRemoteDataSourceImpl implements PetsInformationRemoteDataSource {
  
  final http.Client client;

  PetsInformationRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<PetInformationModel>> getPetsInformation() async {
    List<PetInformationModel> petList = new List<PetInformationModel>();
    List<dynamic> petsJson = json.decode(await rootBundle.loadString("assets/jsons/pets_information.json"));
    petList = petsJson.map((i)=>PetInformationModel.fromJson(i)).toList();
    return petList; 
  }
}