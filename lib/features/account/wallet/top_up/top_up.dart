import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/utils/input_formatters.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/account/wallet/presentation/widgets/details_list_tile.dart';
import 'package:kidbank/features/account/wallet/presentation/widgets/payment_methods.dart';
import 'package:kidbank/features/account/wallet/top_up/amount_selection.dart';
import 'package:kidbank/features/account/wallet/top_up/riverpod.dart';
import '../../../../core/colors.dart';
import '../../../../core/widgets/main_back_button.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
        navigationBar: const CupertinoNavigationBar(
          leading: MainBackButton(
            label: 'Back',
          ),
          middle: Text('Top up'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8,),
              const WalletPaymentMethods(),
              const SizedBox(height: 24,),
              CupertinoListSection.insetGrouped(
                margin: EdgeInsets.zero,
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  child:Column(
                    children: [
                      CustomTextField(
                        label: 'Amount',
                        required: true,
                        placeholder: '\$40',
                        suffixBuilder: (context,state,isError){
                          return Image.asset('assets/images/money_send.png',width: 24,height: 24,);
                        },
                        controller: controller,
                        keyboardType: TextInputType.number,
                        formatters: [
                          MoneyInputFormatter()
                        ],
                      ),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          return TopUpAmountSelection(
                            onAmountSelected: (value){
                            String noCurrencyText=value.substring(1,value.length);
                            controller.text=noCurrencyText;
                            //TODO TEMP
                            double amount=double.parse(noCurrencyText);
                            double? current=ref.read(tempCurrentAmountProvider);
                            if(current==null){
                              ref.read(tempCurrentAmountProvider.notifier).setAmount(100);
                            }
                            current=100;
                            double total=current+amount;
                            ref.read(selectedAmountProvider.notifier).setAmount(amount);
                            ref.read(tempTotalAmountProvider.notifier).setAmount(total);

                            //TEMP
                          },);
                        },
                      )
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 24,),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  double current=ref.watch(tempCurrentAmountProvider)??0;
                  double total=ref.watch(tempTotalAmountProvider)??0;
                  return CupertinoListSection.insetGrouped(
                    margin: EdgeInsets.zero,
                    children: [
                      DetailsListTile(title: 'Current amount', value: '\$$current'),
                      DetailsListTile(title: 'Total amount', value: '\$$total'),
                    ],
                  );
                },
              ),
              const Spacer(),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  double? amount =  ref.watch(selectedAmountProvider);
                  return MainButton(
                    text: 'Top up',
                    icon: Image.asset('assets/images/money_add.png',width: 24,height: 24,color: Colors.orange500,),
                    onTap:amount!=null?(){
                      //TODO onTopUp
                    }:null,
                    pressedOpacity: 0.8,
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}


