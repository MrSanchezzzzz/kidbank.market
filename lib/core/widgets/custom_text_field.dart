import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kidbank/core/utils/input_formatters.dart';
import '../colors.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? helpText;
  final bool required;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? placeholder;
  final Widget Function(BuildContext context, CustomTextFieldState state, bool isError)? prefixBuilder;
  final Widget Function(BuildContext context, CustomTextFieldState state, bool isError)? suffixBuilder;
  final bool obscureText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? formatters;
  final bool readOnly;
  final FocusNode? focusNode;
  const CustomTextField(
      {super.key,
      this.label,
      this.helpText,
      this.required = false,
      this.validator,
      this.enabled = true,
      this.placeholder,
      this.prefixBuilder,
      this.suffixBuilder,
      this.obscureText = false,
      this.controller,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.formatters,
      this.readOnly=false,
        this.focusNode
      });

  factory CustomTextField.password(
      {String? label,
      String? helpText,
      bool required = false,
      String? Function(String?)? validator,
      bool enabled = true,
      String? placeholder,
      TextEditingController? controller,
      List<TextInputFormatter>? formatters}) {
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
              color: isError ? const Color(0xFFFF0000) : Colors.grey300,
            ));
      },
      controller: controller,
      formatters: formatters,
    );
  }

  factory CustomTextField.search(
      {String placeholder = 'Search',
      String? label,
      String? helpText,
      bool required = false,
      String? Function(String?)? validator,
      bool enabled = true,
      Function(String)? onSearch,
      Function()? onCameraTap,
      List<TextInputFormatter>? formatters,
      bool showCamera=true
      }) {
    TextEditingController controller = TextEditingController();
    if (onSearch != null) {
      controller.addListener(() {
        onSearch(controller.text);
      });
    }
    return CustomTextField(
      placeholder: placeholder,
      label: label,
      helpText: helpText,
      required: required,
      validator: validator,
      enabled: enabled,
      prefixBuilder: (context, state, isError) {
        return Image.asset(
          'assets/images/search.png',
          width: 24,
          height: 24,
        );
      },
      suffixBuilder: showCamera?(context, state, isError) {
        return GestureDetector(
          onTap: onCameraTap,
          child: Image.asset(
            'assets/images/camera.png',
            width: 24,
            height: 24,
          ),
        );
      }:null,
      controller: controller,
      formatters: formatters,
    );
  }

  factory CustomTextField.price({
    String? label,
    String? helpText,
    bool required = false,
    String? Function(String?)? validator,
    bool enabled = true,
    String? placeholder,
    TextEditingController? controller,
  }) {
    return CustomTextField(
      label: label,
      helpText: helpText,
      required: required,
      validator: validator,
      enabled: enabled,
      placeholder: placeholder,
      controller: controller,
      prefixBuilder: (context, state, isError) => Text(
        '\$',
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: Colors.grey300),
      ),
      keyboardType: TextInputType.number,
      formatters: [MoneyInputFormatter()],
    );
  }

  factory CustomTextField.quantity({
    String? label,
    String? helpText,
    bool required = false,
    String? Function(String?)? validator,
    bool enabled = true,
    String? placeholder,
    TextEditingController? controller,
  }) {
    controller = controller ?? TextEditingController(text: '1');
    return CustomTextField(
      label: label,
      helpText: helpText,
      required: required,
      validator: validator,
      enabled: enabled,
      placeholder: placeholder,
      controller: controller,
      suffixBuilder: (context, state, isError) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if(controller!=null&&controller.text.isNotEmpty) {
                  controller.text = (int.parse(controller.text) + 1).toString();
                }
              },
              child: Icon(
                CupertinoIcons.plus,
                size: 18,
                color: Colors.grey300,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
              onTap: () {
                if(controller!=null&&controller.text.isNotEmpty) {
                  int num=int.parse(controller.text);
                  if(num>1) {
                    controller.text = (--num).toString();
                  }
                }
              },
              child: Icon(
                CupertinoIcons.minus,
                size: 18,
                color: Colors.grey300,
              ),
            )
          ],
        );
      },
      keyboardType: TextInputType.number,
      formatters: [DigitsInputFormatter()],
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
    _focusNode = widget.focusNode??FocusNode();
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            widget.label != null
                ? Text(
                    widget.label!,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 13, color: Colors.grey300, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  )
                : Container(),
            if (widget.required)
              Text(
                ' *',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(fontSize: 13, color: const Color(0xFFFF0000), fontWeight: FontWeight.w700),
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
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
          onChanged: _handleTextChanged,
          obscureText: obscure,
          placeholder: widget.placeholder,
          placeholderStyle: TextStyle(
            color: _error ? const Color(0xFFFF0000) : Colors.grey200,
          ),
          prefix: widget.prefixBuilder != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: widget.prefixBuilder!(context, this, _error),
                )
              : null,
          suffix: widget.suffixBuilder != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: widget.suffixBuilder!(context, this, _error),
                )
              : null,
          controller: widget.controller,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.formatters,
          readOnly: widget.readOnly,
        ),
        Text(
          _error ? _errorText : widget.helpText ?? '',
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
