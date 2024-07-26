import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
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
    return CupertinoButton(
      onPressed: () => _onTap(context),
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Container(
          height: 56,
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white100,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ClipOval(
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: account_photo,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$name $surname',
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: Colors.grey500,
                        ),
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        children: [
                          Text(
                            'Rating: ',
                            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 15,
                              color: Colors.grey300,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SizedBox(width: 16, height: 16, child: full_star),
                          SizedBox(width: 16, height: 16, child: full_star),
                          SizedBox(width: 16, height: 16, child: full_star),
                          SizedBox(width: 16, height: 16, child: full_star),
                          SizedBox(width: 16, height: 16, child: star),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: right_icon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}