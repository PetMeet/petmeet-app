import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_team/pets/domain/usecases/get_pets_information.dart';
import 'package:pet_team/pets/presentation/bloc/bloc.dart';
import 'package:pet_team/pets/presentation/bloc/petsinformationbloc_bloc.dart';

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
    test('', () {
      
    });
  });
}
