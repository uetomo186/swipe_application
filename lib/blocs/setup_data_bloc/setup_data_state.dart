import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

sealed class SetupDataState extends Equatable {
  const SetupDataState();

  @override
  List<Object> get props => [];
}

final class SetupDataInitial extends SetupDataState {}

final class SetupDataFailure extends SetupDataState {}

final class SetupDataLoading extends SetupDataState {}

final class SetupDataSuccess extends SetupDataState {
  final MyUser myUser;

  const SetupDataSuccess(this.myUser);
  @override
  List<Object> get props => [myUser];
}
