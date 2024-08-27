import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_button.dart';

import '../../components/info_appbar.dart';

class AccountInfo extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController emailController;

  const AccountInfo({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.emailController,
  });

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool _isEditing = false;

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _confirmChanges() {
    Navigator.pop(context, {
      'name': widget.nameController.text,
      'surname': widget.surnameController.text,
      'email': widget.emailController.text,
    });
  }

  void _cancelChanges() {
    setState(() {
      widget.nameController.text = 'Veronika';
      widget.surnameController.text = 'Shvets';
      widget.emailController.text = 'veronika.shvets@gmail.com';
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoAppbar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Name',
                    controller: widget.nameController,
                    enabled: _isEditing,
                    required: true,
                  ),
                  CustomTextField(
                    label: 'Surname',
                    controller: widget.surnameController,
                    enabled: _isEditing,
                    required: true,
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: widget.emailController,
                    enabled: _isEditing,
                    suffixBuilder:  (context, state, isError) {
                      return input_label;
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: _isEditing
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButton(
                    text: 'Cancel',
                    onTap: _cancelChanges,
                    color: Colors.orange100,
                  ),
                  const SizedBox(height: 16,),
                  MainButton(
                    text: 'Confirm',
                    onTap: _confirmChanges,
                    color: Colors.orange300,
                  )
                ],
              )
                  : MainButton(
                color: Colors.orange300,
                text: 'Edit',
                onTap: _toggleEditMode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}