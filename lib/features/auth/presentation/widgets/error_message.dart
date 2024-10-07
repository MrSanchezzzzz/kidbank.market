import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/auth/providers/error_text_provider.dart';

import '../../../../core/colors.dart';

class AuthErrorMessage extends ConsumerWidget {
  const AuthErrorMessage({super.key,required this.errorTextProvider,this.errorShowTimerProvider});
  final StateProvider<String?> errorTextProvider;
  final StateProvider<bool>? errorShowTimerProvider;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    String? errorMessage=ref.watch(errorTextProvider);
    bool displayTimer=false;
    if(errorShowTimerProvider!=null) {
      displayTimer = ref.watch(errorShowTimerProvider!);
    }
    if(errorMessage==null){
      return const SizedBox.shrink();
    }
    else{
      Text errorText=Text(errorMessage,style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
        color: Colors.red200
        ),
        textAlign: TextAlign.center,
      );
      if(displayTimer){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            errorText,
            Wrap(
                children: [
                  errorText,
                  const Text('Account will be available in 30 min'),
                  const SizedBox(height: 24,)
                ],
            )
          ],
        );
      }
      return Padding(padding: const EdgeInsets.only(bottom: 24),child: errorText,);
    }
  }
}
