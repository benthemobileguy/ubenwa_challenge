part of 'newborn_bloc.dart';

abstract class NewBornState extends Equatable {
  const NewBornState();

  @override
  List<Object> get props => [];

  Map<String, dynamic>? toJson() {}
}

class NewBornLoading extends NewBornState {}
class NewBornError extends NewBornState {}
class NewBornLoaded extends NewBornState {
  final NewBorn listOfNewBorn;

  const NewBornLoaded(this.listOfNewBorn);

  @override
  List<Object> get props => [listOfNewBorn];

  @override
  Map<String, dynamic> toJson() {
    //converts list of favourites to json while storing the list
    return {'newborns' : listOfNewBorn};
  }
}

