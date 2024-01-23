import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_application/blocs/setup_data_bloc/setup_data_event.dart';
import 'package:swipe_application/blocs/setup_data_bloc/setup_data_state.dart';
import 'package:user_repository/user_repository.dart';

class SetupDataBloc extends Bloc<SetupDataEvent, SetupDataState> {
  UserRepository userRepository;

  SetupDataBloc(this.userRepository) : super(SetupDataInitial()) {
    on<SetupRequired>((event, emit) async {
      emit(SetupDataLoading());
      try {
        MyUser updatedUser = await userRepository.userSetup(event.myUser);
        emit(SetupDataSuccess(updatedUser));
      } catch (e) {
        emit(SetupDataFailure());
      }
    });
  }
}
