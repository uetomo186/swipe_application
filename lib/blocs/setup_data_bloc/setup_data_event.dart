import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

sealed class SetupDataEvent extends Equatable {
  const SetupDataEvent();

  @override
  List<Object> get props => [];
}

class SetupRequired extends SetupDataEvent {
  final MyUser myUser;

  const SetupRequired(this.myUser);

  @override
  List<Object> get props => [myUser];
}
