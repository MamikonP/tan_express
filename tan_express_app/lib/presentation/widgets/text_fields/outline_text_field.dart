import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/gaps.dart';
import 'text_field_decoration.dart';

class OutlineTextField extends StatefulWidget {
  const OutlineTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.controller,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.maxLines,
      this.minLines = 1,
      this.padding,
      this.backgroundColor,
      this.enabled = true})
      : validator = null,
        formFieldKey = null;

  const OutlineTextField.formField(
      {super.key,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.controller,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.maxLines,
      this.minLines = 1,
      this.validator,
      this.formFieldKey,
      this.padding,
      this.backgroundColor,
      this.enabled = true});

  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onChanged;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextCapitalization capitalization;
  final TextInputType? textInputType;
  final int? maxLines;
  final int minLines;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState<dynamic>>? formFieldKey;
  final EdgeInsets? padding;
  final bool enabled;
  final Color? backgroundColor;

  @override
  State<OutlineTextField> createState() => _OutlineTextFieldState();
}

class _OutlineTextFieldState extends State<OutlineTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: widget.validator != null
            ? TextFormField(
                enabled: widget.enabled,
                key: widget.formFieldKey,
                focusNode: _focusNode,
                onChanged: widget.onChanged,
                textInputAction: widget.textInputAction,
                controller: _controller,
                maxLines: widget.maxLines,
                keyboardType: widget.textInputType,
                decoration: _decoration(context),
                textCapitalization: widget.capitalization,
                validator: widget.validator)
            : TextField(
                enabled: widget.enabled,
                focusNode: _focusNode,
                onChanged: widget.onChanged,
                textInputAction: widget.textInputAction,
                controller: _controller,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                keyboardType: widget.textInputType,
                textCapitalization: widget.capitalization,
                decoration: _decoration(context),
              ));
  }

  InputDecoration _decoration(BuildContext context) {
    return DefaultDecoration.of(context).copyWith(
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: Gaps.medium.leftPadding.copyWith(right: Gaps.small),
                child: widget.prefixIcon,
              ),
        suffixIcon: _focused
            ? widget.suffixIcon == null
                ? null
                : Padding(
                    padding: Gaps.medium.rightPadding,
                    child: widget.suffixIcon,
                  )
            : null,
        alignLabelWithHint: true,
        labelText: widget.labelText,
        contentPadding:
            EdgeInsets.zero.copyWith(left: Gaps.large, right: Gaps.large),
        prefixIconConstraints:
            const BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIconConstraints:
            const BoxConstraints(minHeight: 24, minWidth: 24));
  }
}
