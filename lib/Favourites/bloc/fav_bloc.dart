import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice/items.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  FavBloc() : super(FavInitial()) {
    on<AddToFavourite>((event, emit) {
      final currentState = state;
      if (currentState is FavouriteLoaded) {
        final List<Item> updatedFavourites = List.from(currentState.favourites)
          ..add(event.item);
        emit(FavouriteLoaded(updatedFavourites));
      } else {
        emit(FavouriteLoaded([event.item]));
      }
    });

    on<RemoveFromFavourite>((event, emit) {
      final currentState = state;
      if (currentState is FavouriteLoaded) {
        final List<Item> updatedFavourites = List.from(currentState.favourites)
          ..remove(event.item);
        emit(FavouriteLoaded(updatedFavourites));
      }
    });
  }
}
