import 'package:dartz/dartz.dart';
import 'package:pet_team/core/error/failures.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';

abstract class PetsInfoRepository {
  Future<Either<Failure, List<PetInfo>>> getPetsInformation();
}