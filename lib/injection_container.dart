import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_team/core/platform/network_info.dart';
import 'package:pet_team/pets/data/datasources/pets_information_local_data_source.dart';
import 'package:pet_team/pets/data/datasources/pets_information_remote_data_source.dart';
import 'package:pet_team/pets/data/repositories/pets_info_repository_impl.dart';
import 'package:pet_team/pets/domain/repositories/pets_info_repository.dart';
import 'package:pet_team/pets/domain/usecases/get_pets_information.dart';
import 'package:pet_team/pets/presentation/bloc/petsinformationbloc_bloc.dart';

import 'package:http/http.dart' as http;

//Service locator
final sl = GetIt.instance;

void init() {
  // Features

  //Bloc
  sl.registerFactory(() => PetsinformationblocBloc(getPetsInformation: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPetsInformation(sl()));

  sl.registerLazySingleton<PetsInfoRepository>(
    () => PetsInformationRespositoryImpl(
        localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PetsInformationLocalDataSource>(
    () => PetsInformationLocalDataSourceImpl()
  );
  sl.registerLazySingleton<PetsInformationRemoteDataSource>(
    () => PetsInformationRemoteDataSourceImpl(client: sl())
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  

  // External
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
