import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../l10n/l10n.dart';
import '../../../../logic/profile/profile_bloc.dart';
import '../../../constants/gaps.dart';
import '../../../shared/validator.dart';
import '../../text_fields/outline_text_field.dart';
import '../../text_fields/phone_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({this.fullNameFormKey, this.emailFormKey, super.key});

  final GlobalKey<FormFieldState<dynamic>>? fullNameFormKey;
  final GlobalKey<FormFieldState<dynamic>>? emailFormKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OutlineTextField.formField(
          formFieldKey: fullNameFormKey,
          textInputAction: TextInputAction.next,
          capitalization: TextCapitalization.words,
          labelText: L10n.of(context).tr.fullName,
          validator: (String? value) =>
              Validator.of(context).validateFullName(value),
          onChanged: (String? value) {
            context.read<ProfileBloc>().add(UpdateFullNameEvent(value));
            fullNameFormKey?.currentState?.validate();
          },
        ),
        Gaps.large.verticalSpace,
        OutlineTextField.formField(
          formFieldKey: emailFormKey,
          labelText: L10n.of(context).tr.email,
          validator: Validator.of(context).validateEmail,
          textInputType: TextInputType.emailAddress,
          onChanged: (String? value) {
            context.read<ProfileBloc>().add(UpdateEmailEvent(value));
            emailFormKey?.currentState?.validate();
          },
        ),
        Gaps.large.verticalSpace,
        PhoneField(
          textInputAction: TextInputAction.next,
          labelText: L10n.of(context).tr.phoneNumber,
          onChanged: (PhoneNumber? phoneNumber) {
            context.read<ProfileBloc>().add(phoneNumber?.isValid() == true
                ? UpdatePhoneNumberEvent(
                    phoneNumber?.international, phoneNumber?.countryCode)
                : const UpdatePhoneNumberEvent('', ''));
          },
        ),
      ],
    );
  }
}
