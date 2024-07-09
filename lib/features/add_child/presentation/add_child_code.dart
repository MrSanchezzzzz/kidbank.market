
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/mascot_info.dart';

import '../../../core/widgets/main_back_button.dart';

class AddChildCodeScreen extends StatefulWidget {
  const AddChildCodeScreen({super.key,this.count,this.currentIndex});
  final int? count;
  final int? currentIndex;
  @override
  State<AddChildCodeScreen> createState() => _AddChildCodeScreenState();
}

class _AddChildCodeScreenState extends State<AddChildCodeScreen> {
  Map<int,String> ordinalNumbers={
    1:'first',
    2:'second',
    3:'third',
    4:'fourth',
  };
  bool showQrCode=true;
  late int childIndex;
  @override
  void initState() {
    childIndex=widget.currentIndex??0;
    print('Code:\n${widget.count};$childIndex');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainBackButton(label: 'Back'),
            ],
          ),
          middle: Text('Add child'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showQrCode?Column(
                children: [
                  const SizedBox(height: 8,),
                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),color: Color(0xFFD9D9D9)),
                    padding: const EdgeInsets.all(8),
                    child: const Placeholder(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                    child: Text('Share this QR code with your child so he/she can link account.',
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: const Color(0xFF616161)
                        ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ):
              Column(
                children: [
                  const SizedBox(height: 8,),
                  Container(
                    margin:const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        childIndex>0?MascotInfo(text:'The ${ordinalNumbers[childIndex]} child has been added successfully! Let’s move to the next one.'):Container(),
                        SizedBox(height: 24,),
                        Text('899 - 011',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
                        const SizedBox(height: 16,),
                        Text('Enter the following verification code to the child’s application.',
                          style: CupertinoTheme.of(context).textTheme.textStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              //TODO remove gesture detector. It serves for dev access to next screen
              GestureDetector(
                onLongPress: (){
                    context.push('/add_child/nickname',extra: {'count':widget.count,'currentIndex':childIndex});
                  },

                child: MainButton(text:'Use security code',
                  onTap: (){setState(() {
                    showQrCode=!showQrCode;
                  });},
                  color: const Color(0xFFFFF1E4),
                ),
              )
            ],
          ),
        )
    );
  }
}
