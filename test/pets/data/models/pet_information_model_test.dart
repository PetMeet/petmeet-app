import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pet_team/pets/data/models/pet_information_model.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPetInformationModel = PetInformationModel(
      name: 'Pancho', animalShelter: 'animalShelter1', picture: 'picture1.png');

  test('should be a PetInfo', () async {
    //assert
    expect(tPetInformationModel, isA<PetInfo>());
  });

  group('fromJson', () {
    test('should return a valid model when the json is correct', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('pet_information.json'));

      //act
      final result = PetInformationModel.fromJson(jsonMap);

      //assert
      expect(result, tPetInformationModel);
    });
  });

  group('toJson', () {
    test('should return a Json map containg the pet info data', () async {
      //act
      final result = tPetInformationModel.toJson();

      //assert
      final expectedMap = {
        "name": "Pancho",
        "animalShelter": "animalShelter1",
        "picture": "picture1.png"
      };
      expect(result, expectedMap);
    });
  });
}
