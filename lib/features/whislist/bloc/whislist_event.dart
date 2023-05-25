part of 'whislist_bloc.dart';

@immutable
abstract class WhislistEvent {}
class WhislistInitialEvent extends WhislistEvent{
  
}


class WhislistRemoveFromWhislistEvent extends WhislistEvent {
  final ProductDataModel productDataModel;
  WhislistRemoveFromWhislistEvent({
    required this.productDataModel,
  });
}