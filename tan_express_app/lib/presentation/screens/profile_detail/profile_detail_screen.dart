import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../logic/profile/profile_bloc.dart';
import '../../constants/gaps.dart';
import '../../mixins/form_key_mixin.dart';
import '../../shared/modal_popup.dart';
import '../../shared/snackbar.dart';
import '../../widgets/general/app_button.dart';
import '../../widgets/screen_components/profile/profile_form.dart';
import '../app_screen.dart';

class ProfileDetailScreen extends StatelessWidget with FormKeyMixin {
  ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            pinned: true,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Ändra uppgifter',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (BuildContext context, ProfileState state) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: profileFormKey,
                  child: Padding(
                    padding: Gaps.large.allPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ProfileForm(
                            fullNameFormKey: fullNameFormKey,
                            emailFormKey: emailFormKey),
                        Gaps.extraLarge.verticalSpace,
                        AppButton(
                          text: 'Spara',
                          disabled: _buttonDisabled(context),
                          radius: 100,
                          backgroundColor: const Color(0xffFF9500),
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                          onTap: () => CustomSnackbar.of(context)
                              .showSuccessSnackbar('Uppgifter uppdaterade!'),
                        ),
                        Gaps.large.verticalSpace,
                        Center(
                          child: AppButton(
                            text: 'Ta bort mitt konto',
                            radius: 100,
                            backgroundColor: const Color(0xffE5E5EA),
                            onTap: () async {
                              await showPopup(context,
                                  title: 'Vill du ta bort ditt konto?',
                                  content: 'Denna åtgärd kan inte ångras');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  bool _buttonDisabled(BuildContext context) {
    final ProfileState state = context.read<ProfileBloc>().state;
    return (state.fullName?.isEmpty ?? true) ||
        (state.phoneNumber?.isEmpty ?? true) ||
        (state.email?.isEmpty ?? true);
  }
}
