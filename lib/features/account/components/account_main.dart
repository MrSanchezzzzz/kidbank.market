import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
import 'package:kidbank/features/account/rating/components/rating_star.dart';
import '../presentation/screens/account_info.dart';

class AccountMain extends StatefulWidget {
  const AccountMain({super.key});

  @override
  _AccountMainState createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  String name = 'Veronika';
  String surname = 'Shvets';
  String email = 'veronika.shvets@gmail.com';
  double rating = 3.5;

  void _onTap(BuildContext context) async {
    final result = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => AccountInfo(
          nameController: TextEditingController(text: name),
          surnameController: TextEditingController(text: surname),
          emailController: TextEditingController(text: email),
        ),
      ),
    );

    if (result != null) {
      print('Result: $result');

      setState(() {
        name = result['name'] ?? name;
        surname = result['surname'] ?? surname;
        email = result['email'] ?? email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CupertinoListTile(
              backgroundColorActivated: Colors.white100,
              onTap: () => _onTap(context),
              padding: EdgeInsets.zero,
              leading: ClipOval(
                child: account_photo,
              ),
              title: Text(
                '$name $surname',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: Colors.grey500,
                ),
              ),
              trailing: SizedBox(
                width: 24,
                height: 24,
                child: right_icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}