import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/ui_card.dart';

class OnboardingRoleSelect extends StatefulWidget {
  const OnboardingRoleSelect({super.key});

  @override
  State<OnboardingRoleSelect> createState() => _OnboardingRoleSelectState();
}

class _OnboardingRoleSelectState extends State<OnboardingRoleSelect> {
  int selectedIndex=0;
  void selectRole(int index){
    setState(() {
      selectedIndex = index;
    });
    //TODO add riverpod for selected role
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UiCard.parent(
          checked: selectedIndex==0,
          onChanged: (){selectRole(0);},
        ),
        const SizedBox(width: 16,),
        UiCard.child(
          checked: selectedIndex==1,
          onChanged: (){selectRole(1);},
        ),
      ],
    );
  }
}
