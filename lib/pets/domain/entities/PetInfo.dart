import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PetInfo extends Equatable {
  final String name;
  final String animalShelter;
  final String picture;

  PetInfo({@required this.name, @required this.animalShelter, @required this.picture})
      : super([name, animalShelter, picture]);
}