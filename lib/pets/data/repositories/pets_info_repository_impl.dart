import 'package:dartz/dartz.dart';
import 'package:pet_team/core/error/failures.dart';
import 'package:pet_team/core/platform/network_info.dart';
import 'package:pet_team/pets/data/datasources/pets_information_local_data_source.dart';
import 'package:pet_team/pets/data/datasources/pets_information_remote_data_source.dart';
import 'package:pet_team/pets/domain/entities/PetInfo.dart';
import 'package:pet_team/pets/domain/repositories/pets_info_repository.dart';
import 'package:meta/meta.dart';

class PetsInformationRespositoryImpl implements PetsInfoRepository {
  final PetsInformationRemoteDataSource remoteDataSource;
  final PetsInformationLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PetsInformationRespositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, List<PetInfo>>> getPetsInformation() async {
    networkInfo.isConnected;
    return Right(await localDataSource.getPetsInformation());
  }
}
