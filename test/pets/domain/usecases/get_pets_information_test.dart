import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_team/core/usecases/usecase.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';
import 'package:pet_team/pets/domain/repositories/pets_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_team/pets/domain/usecases/get_pets_information.dart';

class MockPetsInfoRepository extends Mock implements PetsInfoRepository {}

void main() {
  GetPetsInformation usecase;
  MockPetsInfoRepository mockPetsInfoRepository;
  setUp(() {
    mockPetsInfoRepository = MockPetsInfoRepository();
    usecase = GetPetsInformation(mockPetsInfoRepository);
  });

  final List<PetInfo> petsInfo = [PetInfo(name: 'Pancho', animalShelter: 'Apadan', picture: 'picture.png')];

  test(
     'should get pets information from the repository',
     () async {
       //arrange
       when(mockPetsInfoRepository.getPetsInformation()).thenAnswer((_) async => Right(petsInfo));

       //act
       final result = await usecase(NoParams());

       //assert
       expect(result, Right(petsInfo));
       verify(mockPetsInfoRepository.getPetsInformation());
       verifyNoMoreInteractions(mockPetsInfoRepository);
     }
  );
}