part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => <Object>[];
}

class UpdatePhoneNumberEvent extends ProfileEvent {
  const UpdatePhoneNumberEvent(this.phoneNumber, this.phonePrefix);

  final String? phoneNumber;
  final String? phonePrefix;
}

class UpdateFullNameEvent extends ProfileEvent {
  const UpdateFullNameEvent(this.fullName);

  final String? fullName;
}

class UpdateEmailEvent extends ProfileEvent {
  const UpdateEmailEvent(this.email);

  final String? email;
}
