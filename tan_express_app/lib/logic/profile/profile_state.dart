part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState(
      {this.phoneNumber, this.phonePrefix, this.fullName, this.email});

  final String? phoneNumber;
  final String? phonePrefix;
  final String? fullName;
  final String? email;

  @override
  List<Object?> get props =>
      <Object?>[phoneNumber, phonePrefix, fullName, email];
}

final class ProfileInitial extends ProfileState {}

class ProfileUpdated extends ProfileState {
  ProfileUpdated(ProfileState initState,
      {String? fullName,
      String? phoneNumber,
      String? phonePrefix,
      String? email})
      : super(
            phoneNumber: phoneNumber ?? initState.phoneNumber,
            phonePrefix: phonePrefix ?? initState.phonePrefix,
            fullName: fullName ?? initState.fullName,
            email: email ?? initState.email);
}
