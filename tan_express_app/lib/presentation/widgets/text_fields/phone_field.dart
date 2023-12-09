import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'text_field_decoration.dart';

class PhoneField extends StatefulWidget {
  const PhoneField(
      {this.labelText,
      this.hintText,
      this.required = false,
      this.textInputAction = TextInputAction.done,
      this.onChanged,
      this.validator,
      this.formKey,
      this.isoCountryCode,
      super.key});

  final String? labelText;
  final String? hintText;
  final bool required;
  final TextInputAction textInputAction;
  final void Function(PhoneNumber? phoneNumber)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final GlobalKey<FormState>? formKey;
  final String? isoCountryCode;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final FocusNode _focusNode = FocusNode();
  final PhoneController _controller =
      PhoneController(const PhoneNumber(isoCode: IsoCode.SE, nsn: ''));
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? text = _focused ? null : widget.hintText ?? widget.labelText;
    return Container(
      height: 56,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: PhoneFormField(
        controller: _controller,
        focusNode: _focusNode,
        defaultCountry: IsoCode.fromJson(widget.isoCountryCode ?? 'SE'),
        textInputAction: widget.textInputAction,
        decoration: DefaultDecoration.of(context).copyWith(
          alignLabelWithHint: true,
          labelText: text != null && widget.validator != null ? '$text*' : text,
          labelStyle: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        validator:
            widget.validator ?? PhoneValidator.validMobile(allowEmpty: false),
        autofillHints: const <String>[AutofillHints.telephoneNumber],
        onSaved: (PhoneNumber? p) {},
        onChanged: widget.onChanged,
      ),
    );
  }
}
