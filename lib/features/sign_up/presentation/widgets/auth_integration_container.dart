
import 'package:flutter/cupertino.dart';


class AuthIntegrationContainer extends StatelessWidget {
  const AuthIntegrationContainer({super.key,required this.companyName,required this.companyLogo,this.onTap});
  
  factory AuthIntegrationContainer.apple({Function()? onTap}){
    return AuthIntegrationContainer(companyName: 'Apple', companyLogo: Image.asset('assets/images/apple.png',width: 24,height: 24,),onTap: onTap,);
  }
  factory AuthIntegrationContainer.google({Function()? onTap}){
    return AuthIntegrationContainer(companyName: 'Google', companyLogo: Image.asset('assets/images/google.png',width: 24,height: 24,),onTap: onTap,);
  }
  
  final String companyName;
  final Image companyLogo;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10)
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            companyLogo,
            const SizedBox(width: 10,),
            Text('Continue with $companyName',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.w700),)
          ]
        ),
      ),
    );
  }
}
