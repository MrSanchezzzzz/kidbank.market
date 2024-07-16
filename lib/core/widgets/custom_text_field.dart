import 'package:flutter/cupertino.dart';
import '../colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? helpText;
  final bool required;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? placeholder;
  final Widget Function(BuildContext context, CustomTextFieldState state, bool isError)? suffixBuilder;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    this.helpText,
    this.required = false,
    this.validator,
    this.enabled = true,
    this.placeholder,
    this.suffixBuilder,
    this.obscureText = false,
  });

  factory CustomTextField.password({
    required String label,
    String? helpText,
    bool required = false,
    String? Function(String?)? validator,
    bool enabled = true,
    String? placeholder,
  }) {
    return CustomTextField(
      label: label,
      helpText: helpText,
      required: required,
      validator: validator,
      enabled: enabled,
      placeholder: placeholder,
      obscureText: true,
      suffixBuilder: (context, state, isError) {
        return GestureDetector(
            onTap: () {
              state.toggleObscure();
            },
            child: Image.asset(
              state.obscure ? 'assets/images/eye_slash.png' : 'assets/images/eye.png',
              width: 24,
              height: 24,
              color: isError ? Color(0xFFFF0000) : Colors.grey300,
            ));
      },
    );
  }

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _error = false;
  String _errorText = '';
  late bool obscure;
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    obscure = widget.obscureText;
    super.initState();
  }

  void toggleObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  Color getBorderColor() {
    if (_error) {
      return const Color(0xFFFF0000);
    } else if (_focusNode.hasFocus) {
      return Colors.purple200;
    }
    return Colors.grey100;
  }

  void _handleTextChanged(String value) {
    if (widget.validator != null) {
      if (value.isEmpty) {
        setState(() {
          _error = false;
          _errorText = '';
        });
        return;
      }
      String? validation = widget.validator!(value);
      if (validation != null) {
        setState(() {
          _error = true;
          _errorText = validation;
        });
      } else {
        setState(() {
          _error = false;
          _errorText = '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 13,
                    color: Colors.grey300,
                  ),
              textAlign: TextAlign.left,
            ),
            if (widget.required)
              Text(
                ' *',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 13,
                      color: const Color(0xFFFF0000),
                    ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        CupertinoTextField(
          focusNode: _focusNode,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: getBorderColor()),
          ),
          onChanged: _handleTextChanged,
          obscureText: obscure,
          placeholder: widget.placeholder,
          placeholderStyle: TextStyle(
            color: _error ? const Color(0xFFFF0000) : Colors.grey200,
          ),
          suffix: widget.suffixBuilder != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: widget.suffixBuilder!(context, this, _error),
                )
              : null,
        ),
        Text(
          _error ? _errorText : widget.helpText??'',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 13,
                color: _error ? const Color(0xFFFF0000) : Colors.grey300,
              ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
