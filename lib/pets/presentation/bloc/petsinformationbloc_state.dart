import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';

@immutable
abstract class PetsinformationblocState extends Equatable {
  PetsinformationblocState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends PetsinformationblocState {}

class Loading extends PetsinformationblocState {}

class PetsInformationLoaded extends PetsinformationblocState {
  final List<PetInfo> petsInformation;
  PetsInformationLoaded({@required this.petsInformation})
      : super([petsInformation]);
}

class Error extends PetsinformationblocState {
  final String message;
  Error({@required this.message}) : super([message]);
}
