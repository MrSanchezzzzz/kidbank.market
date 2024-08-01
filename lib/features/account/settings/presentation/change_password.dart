import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import '../../../../core/images.dart';
import '../../../../core/widgets/main_back_button.dart';
import '../../components/info_appbar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isEditing = true;

  void _confirmChanges() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const MainBackButton(label: 'Back'),
        middle: Text(
          'Change password',
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
            color: CupertinoColors.black,
          ),
        ),
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        border: const Border(bottom: BorderSide.none),
      ),
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Enter old password',
                    enabled: _isEditing,
                    suffixBuilder: (context, state, isError) {
                      return eye_block;
                    },
                    placeholder: 'Password',
                    required: true,
                  ),
                  CustomTextField(
                    label: 'Enter new password',
                    enabled: _isEditing,
                    suffixBuilder: (context, state, isError) {
                      return eye_block;
                    },
                    placeholder: 'Password',
                    required: true,
                  ),
                  CustomTextField(
                    label: 'Confirm password',
                    enabled: _isEditing,
                    suffixBuilder: (context, state, isError) {
                      return eye_block;
                    },
                    placeholder: 'Password',
                    required: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: MainButton(
                color: Colors.orange300,
                text: 'Confirm',
                onTap: _confirmChanges,
              ),
            ),
          ],
        ),
      ),
    );
  }
}