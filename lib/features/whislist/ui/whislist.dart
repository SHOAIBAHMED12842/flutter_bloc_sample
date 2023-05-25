import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/whislist/bloc/whislist_bloc.dart';
import 'package:flutter_bloc_tutorial/features/whislist/ui/whislist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WhislistBloc whislistBloc = WhislistBloc();
  
  @override
   void initState() {
    whislistBloc.add(WhislistInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
        centerTitle: true,
      ),
      body: BlocConsumer<WhislistBloc,WhislistState>(
        bloc: whislistBloc,
        listener: (context, state) {
          //print('action emitted');
          if(state is WhislistRemoveActionState){
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item is Shopped!'),),);
             
          }
        },
        listenWhen: (previous, current) => current is WhislistActionState,
        buildWhen: (previous, current) => current is! WhislistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WhislistSuccessState:
              final successState = state as WhislistSuccessState;
              return ListView.builder(
                  itemCount: successState.whislistItems.length,
                  itemBuilder: (context, index) {
                    return WhislistTileWidget(
                        whislistBloc: whislistBloc,
                        productDataModel: successState.whislistItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}