import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/mascot_info.dart';

import '../../../core/widgets/main_back_button.dart';
import '../../../core/widgets/main_button.dart';

class AddChildNicknameScreen extends StatefulWidget {
  const AddChildNicknameScreen({super.key,this.count,this.currentIndex});
  final int? count;
  final int? currentIndex;
  @override
  State<AddChildNicknameScreen> createState() => _AddChildNicknameScreenState();
}

class _AddChildNicknameScreenState extends State<AddChildNicknameScreen> {
  late int childIndex;
  @override
  void initState() {
    childIndex=widget.currentIndex??0;
    super.initState();
    print('Nickname:${widget.count};$childIndex');
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainBackButton(label: 'Back'),

            ],
          ),
          middle: Text('Add child'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(children: [
                MascotInfo(text: 'The account\'s linked. Enter your child\'s nickname.',),
                SizedBox(height: 24,),
                CupertinoTextField(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: MainButton(text: 'Skip',
                    onTap: (){},
                    color: const Color(0xFFFFF1E4),)),
                  const SizedBox(width: 16,),
                  Expanded(child: MainButton(text:'Continue',
                    onTap: (){
                      if(widget.count!=null) {
                        if (++childIndex >= widget.count!) {
                          context.go('/add_child/finish');
                          return;
                        }
                        context.push('/add_child/code',extra: {'count':widget.count,'currentIndex':childIndex});
                      }
                    },))
                ],
              ),

            ],
          ),
        )
    );
  }
}
