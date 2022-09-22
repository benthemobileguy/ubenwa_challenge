part of 'newborn_bloc.dart';

abstract class NewBornEvent extends Equatable {
  const NewBornEvent();

  @override
  List<Object> get props => [];
}

class AddNewBorn extends NewBornEvent {

  const AddNewBorn();

  @override
  List<Object> get props => [];
}

class FetchNewBornEvent extends NewBornEvent {

  const FetchNewBornEvent();

  @override
  List<Object> get props => [];
}

class UpdateNewBornState extends NewBornEvent {
  final bool isCompleted;
  final int id;

  const UpdateNewBornState(this.isCompleted, this.id);

  @override
  List<Object> get props => [isCompleted];
}
