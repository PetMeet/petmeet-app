import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PetsinformationblocEvent extends Equatable {
  PetsinformationblocEvent([List props = const <dynamic>[]]): super(props);
}

class GetPetsInformationEvent extends PetsinformationblocEvent {
  
  GetPetsInformationEvent(): super();
}
