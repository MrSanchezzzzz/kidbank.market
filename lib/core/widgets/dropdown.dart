import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'custom_text_field.dart';

class Dropdown<T> extends StatefulWidget {
  const Dropdown({super.key, this.label,this.placeholder,this.required=false,required this.itemBuilder,required this.onSelected,required this.suggestionsCallback});
  final String? label;
  final String? placeholder;
  final bool required;
  final Widget Function(BuildContext context,T value) itemBuilder;
  final Function(T value) onSelected;
  final FutureOr<List<T>?> Function(String search) suggestionsCallback;

  @override
  State<Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  TextEditingController mainController=TextEditingController();
  FocusNode focusNode=FocusNode();
  @override
  void initState() {
    focusNode.addListener((){
      if(!selected) {
        mainController.text = '';
      }
    });
    super.initState();
  }
  bool selected=false;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      focusNode: focusNode,
      controller: mainController,
      builder: (context,controller,node){
        return CustomTextField(
          label: widget.label,
          placeholder: widget.placeholder,
          required: widget.required,
          controller: controller,
          focusNode: node,
          suffixBuilder: (context,state,isError){
            return Image.asset('assets/images/down.png',width: 24,height: 24,);
          },
        );
      },
      itemBuilder: widget.itemBuilder,
      onSelected: (T value){
        setState(() {
          mainController.text=value.toString();
        });
        FocusScope.of(context).unfocus();
        selected=true;
        widget.onSelected;

      },
      suggestionsCallback: widget.suggestionsCallback,
    );
  }
}
