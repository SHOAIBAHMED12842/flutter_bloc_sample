import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/wishlist_items.dart';
import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'whislist_event.dart';
part 'whislist_state.dart';

class WhislistBloc extends Bloc<WhislistEvent, WhislistState> {
  WhislistBloc() : super(WhislistInitial()) {
    on<WhislistInitialEvent>(whislistInitialEvent);
    on<WhislistRemoveFromWhislistEvent>(whislistRemoveFromWhislistEvent);
  }

  FutureOr<void> whislistInitialEvent(
      WhislistInitialEvent event, Emitter<WhislistState> emit) {
    emit(WhislistSuccessState(whislistItems: wishlistItems));
  }

  FutureOr<void> whislistRemoveFromWhislistEvent(
      WhislistRemoveFromWhislistEvent event, Emitter<WhislistState> emit) {
    wishlistItems.remove(event.productDataModel);

// emit()
    emit(WhislistRemoveActionState());
    emit(WhislistSuccessState(whislistItems: wishlistItems));
  }
}
