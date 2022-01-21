import 'package:equatable/equatable.dart';

abstract class SeatsState extends Equatable {}

class InitialState extends SeatsState {
  @override
  List<Object> get props => [];
}

class SelectingState extends SeatsState {
  @override
  List<Object> get props => [];
}

class SelectedState extends SeatsState {

  @override
  List<Object> get props => [];
}

class RemovingState extends SeatsState {
  @override
  List<Object> get props => [];
}

class ErrorState extends SeatsState {
  @override
  List<Object?> get props => [];
}
