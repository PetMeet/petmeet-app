import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_team/core/error/failures.dart';
import 'package:pet_team/core/usecases/usecase.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';
import 'package:pet_team/pets/domain/usecases/get_pets_information.dart';
import 'package:pet_team/pets/presentation/bloc/bloc.dart';
import 'package:pet_team/pets/presentation/bloc/petsinformationbloc_bloc.dart';
import 'package:dartz/dartz.dart';

class MockGetPetsInformation extends Mock implements GetPetsInformation {}

void main() {
  PetsinformationblocBloc bloc;
  MockGetPetsInformation mockGetPetsInformation;

  setUp(() {
    mockGetPetsInformation = MockGetPetsInformation();

    bloc = PetsinformationblocBloc(getPetsInformation: mockGetPetsInformation);
  });

  test('initialState should be Empty', () {
    //assert
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetPetsInformation', () {
    final List<PetInfo> petsInfo = [
      PetInfo(name: 'Pancho', animalShelter: 'Apadan', picture: 'picture.png')
    ];
    test('should get data from the concrete use case', () async {
      // arrange
      when(mockGetPetsInformation(any))
          .thenAnswer((_) async => Right(petsInfo));
      // act
      bloc.dispatch(GetPetsInformationEvent());
      await untilCalled(mockGetPetsInformation(any));
      //assert
      verify(mockGetPetsInformation(NoParams()));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      // arrange
      when(mockGetPetsInformation(any))
          .thenAnswer((_) async => Right(petsInfo));
      // assert later
      final expected = [
        Empty(),
        Loading(),
        PetsInformationLoaded(petsInformation: petsInfo)
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      //act
      bloc.dispatch(GetPetsInformationEvent());
    });


    test('should emit [Loading, Error] when getting data fails',
        () async {
      // arrange
      when(mockGetPetsInformation(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: "Error")
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      //act
      bloc.dispatch(GetPetsInformationEvent());
    });
  });
}
