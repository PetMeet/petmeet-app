import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_team/core/platform/network_info.dart';
import 'package:pet_team/pets/data/datasources/pets_information_local_data_source.dart';
import 'package:pet_team/pets/data/datasources/pets_information_remote_data_source.dart';
import 'package:pet_team/pets/data/models/pet_information_model.dart';
import 'package:pet_team/pets/data/repositories/pets_info_repository_impl.dart';

class MockLocalDataSource extends Mock implements PetsInformationLocalDataSource {} 

class MockRemoteDataSource extends Mock implements PetsInformationRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  PetsInformationRespositoryImpl repository;
  MockLocalDataSource mockLocalDataSource;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp( () {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PetsInformationRespositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  group('getPetsInformation', () {
  // DATA FOR THE MOCKS AND ASSERTIONS
  // We'll use these three variables throughout all the tests

  test('should check if the device is online', () {
    //arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    // act
    repository.getPetsInformation();
    // assert
    verify(mockNetworkInfo.isConnected);
  });
});

group('device is online', () {
  // This setUp applies only to the 'device is online' group
  setUp(() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  });

  final List<PetInformationModel> tPetsInfoModel = [PetInformationModel(name: 'Pancho', animalShelter: 'Apadan', picture: 'picture.png')];


  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(mockLocalDataSource.getPetsInformation())
          .thenAnswer((_) async => tPetsInfoModel);
      // act
      final result = await repository.getPetsInformation();
      // assert
      verify(mockLocalDataSource.getPetsInformation());
      expect(result, equals(Right(tPetsInfoModel)));
    },
  );
});

/*group('device is offline', () {
  // This setUp applies only to the 'device is online' group
  setUp(() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
  });

  final List<PetInformationModel> tPetsInfoModel = [PetInformationModel(name: 'Pancho', animalShelter: 'Apadan', picture: 'picture.png')];


  test(
    'should return local data when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockLocalDataSource.getPetsInformation())
          .thenAnswer((_) async => tPetsInfoModel);
      // act
      final result = await repository.getPetsInformation();
      // assert
      verify(mockLocalDataSource.getPetsInformation());
      expect(result, equals(Left(ServerFailure())));
    },
  );
});*/

}