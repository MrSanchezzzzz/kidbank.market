import 'package:flutter/cupertino.dart';
import '../colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? helpText;
  final bool required;
  final List<Widget>? trailing;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? placeholder;
  final Widget Function(BuildContext context,bool isError)? suffixBuilder;
  const CustomTextField({
    super.key,
    required this.label,
    this.helpText,
    this.required = false,
    this.trailing,
    this.validator,
    this.enabled = true,
    this.placeholder,
    this.suffixBuilder
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _error = false;
  String _errorText = '';
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
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
          placeholder: widget.placeholder,
          placeholderStyle: TextStyle(
            color: _error ? const Color(0xFFFF0000) : Colors.grey200,
          ),
          suffix: widget.suffixBuilder!=null?widget.suffixBuilder!(context,_error):null,
        ),
        if (widget.helpText != null || _errorText.isNotEmpty)
          Text(
            _error ? _errorText : widget.helpText!,
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
