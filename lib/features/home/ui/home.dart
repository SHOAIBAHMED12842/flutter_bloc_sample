import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/cart/ui/cart.dart';
import 'package:flutter_bloc_tutorial/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_tutorial/features/whislist/ui/whislist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      // listenWhen: (previous, current) => true,
      // buildWhen: (previous, current) => true,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          //print('object');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        } else if (state is HomeNavigateToWhislistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Wishlist(),
            ),
          );
        }
        else if(state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Carted'),),);
        }
         else if(state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Wishlisted'),),);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
          final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeWhislistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                    onPressed: () {
                      homebloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    homebloc: homebloc,
                    productDataModel: successState.products[index]);
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
    // BlocProvider(create: (context) => homebloc,child: BlocListener<HomeBloc, HomeState>(
    //   listener: (context, state) {
    //         if (state is HomeNavigateToCartPageActionState) {
    //       print('object');
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const Cart(),
    //         ),
    //       );
    //     } else if (state is HomeNavigateToWhislistPageActionState) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const Wishlist(),
    //         ),
    //       );
    //     }
    //   },
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Shoaib Grocery App'),
    //         centerTitle: true,
    //         actions: [
    //           IconButton(
    //               onPressed: () {
    //                 homebloc.add(HomeWhislistButtonNavigateEvent());
    //               },
    //               icon: const Icon(Icons.favorite_border)),
    //           IconButton(
    //               onPressed: () {
    //                 homebloc.add(HomeCartButtonNavigateEvent());
    //               },
    //               icon: const Icon(
    //                 Icons.shopping_bag_outlined,
    //               )),
    //         ],
    //       ),
    //     ),
    // ),
    // );
  }
}
