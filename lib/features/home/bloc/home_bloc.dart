import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_bloc_tutorial/data/grocery_data.dart';
import 'package:flutter_bloc_tutorial/data/wishlist_items.dart';
import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';
// import 'package:flutter_bloc_tutorial/features/home/bloc/home_event.dart';
// import 'package:flutter_bloc_tutorial/features/home/bloc/home_state.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWhislistButtonClickedEvent>(
        homeProductWhislistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWhislistButtonNavigateEvent>(homeWhislistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryProduct.groceryProducts.map(
          (e) => ProductDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrls: e['imageUrls']),
        ).toList(),
      ),
    );
  }

  FutureOr<void> homeProductWhislistButtonClickedEvent(
      HomeProductWhislistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Whislist Product Clicked');
    }
    wishlistItems.add(event.clickedProduct);
    //print(wishlistItem.toString());
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Cart Product Clicked');
    }
    cartItems.add(event.clickedProduct);
    //print(cartItem);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWhislistButtonNavigateEvent(
      HomeWhislistButtonNavigateEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Whislist Navigate Clicked');
    }
    emit(HomeNavigateToWhislistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Cart Navigate Clicked');
    }
    emit(HomeNavigateToCartPageActionState());
  }
}
