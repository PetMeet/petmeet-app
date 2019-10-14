import 'package:pet_team/pets/domain/entities/PetInfo.dart';
import 'package:meta/meta.dart';

class PetInformationModel extends PetInfo {
  PetInformationModel(
      {@required String name,
      @required String animalShelter,
      @required String picture})
      : super(name: name, animalShelter: animalShelter, picture: picture);

  factory PetInformationModel.fromJson(Map<String, dynamic> json) {
    return PetInformationModel(
        name: json['name'],
        animalShelter: json['animalShelter'],
        picture: json['picture']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'animalShelter': animalShelter, 'picture': picture};
  }
}

class PetInformationModelList {
  final List<PetInformationModel> petInformationModelList;

  PetInformationModelList({this.petInformationModelList});

  factory PetInformationModelList.fromJson(List<dynamic> parsedJson) {
    List<PetInformationModel> petInformationModelList = new List<PetInformationModel>();
    petInformationModelList = parsedJson.map((i) => PetInformationModel.fromJson(i)).toList();

    return PetInformationModelList(petInformationModelList: petInformationModelList);
  }
}
