import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdatePhoneNumberEvent>(_mapUpdatePhoneNumberEventToState);
    on<UpdateFullNameEvent>(_mapUpdateFullNameEventToState);
    on<UpdateEmailEvent>(_mapUpdateEmailEventToState);
  }

  FutureOr<void> _mapUpdatePhoneNumberEventToState(
      UpdatePhoneNumberEvent event, Emitter<ProfileState> emit) {
    emit(ProfileUpdated(state,
        phoneNumber: event.phoneNumber, phonePrefix: event.phonePrefix));
  }

  FutureOr<void> _mapUpdateFullNameEventToState(
      UpdateFullNameEvent event, Emitter<ProfileState> emit) {
    emit(ProfileUpdated(state, fullName: event.fullName));
  }

  FutureOr<void> _mapUpdateEmailEventToState(
      UpdateEmailEvent event, Emitter<ProfileState> emit) {
    emit(ProfileUpdated(state, email: event.email));
  }
}
