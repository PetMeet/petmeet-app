import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pet_team/core/usecases/usecase.dart';
import 'package:pet_team/pets/domain/usecases/get_pets_information.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class PetsinformationblocBloc
    extends Bloc<PetsinformationblocEvent, PetsinformationblocState> {
  final GetPetsInformation getPetsInformation;

  PetsinformationblocBloc({@required GetPetsInformation getPetsInformation})
      : assert(getPetsInformation != null),
        getPetsInformation = getPetsInformation;

  @override
  PetsinformationblocState get initialState => Empty();

  @override
  Stream<PetsinformationblocState> mapEventToState(
    PetsinformationblocEvent event,
  ) async* {
    if (event is GetPetsInformationEvent) {
      yield Loading();
      final failureOrPetsInfo = await getPetsInformation(NoParams());
      yield failureOrPetsInfo.fold(
        (failure) => Error(message: "Error"), 
        (petsInfo) => PetsInformationLoaded(petsInformation: petsInfo)
        );
    }
  }
}
