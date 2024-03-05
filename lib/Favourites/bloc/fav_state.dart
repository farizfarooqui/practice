part of 'fav_bloc.dart';

abstract class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {}

class FavouriteLoaded extends FavState {
  final List<Item> favourites;

  FavouriteLoaded(this.favourites);
  @override
  List<Object> get props => [favourites];
}
