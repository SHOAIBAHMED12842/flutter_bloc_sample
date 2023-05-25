part of 'whislist_bloc.dart';

@immutable
abstract class WhislistState {}

class WhislistInitial extends WhislistState {}
abstract class WhislistActionState extends WhislistState {}


class WhislistSuccessState extends WhislistState {
  final List<ProductDataModel> whislistItems;
  WhislistSuccessState({
    required this.whislistItems,
  });
}
class WhislistRemoveActionState extends WhislistActionState {}