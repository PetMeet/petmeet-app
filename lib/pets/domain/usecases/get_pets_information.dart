import 'package:dartz/dartz.dart';
import 'package:pet_team/core/error/failures.dart';
import 'package:pet_team/core/usecases/usecase.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';
import 'package:pet_team/pets/domain/repositories/pets_info_repository.dart';

class GetPetsInformation implements UseCase<List<PetInfo>, NoParams> {
  final PetsInfoRepository repository;

  GetPetsInformation(this.repository);

  @override
  Future<Either<Failure, List<PetInfo>>> call(NoParams params) async {
    return await repository.getPetsInformation();
  }
}