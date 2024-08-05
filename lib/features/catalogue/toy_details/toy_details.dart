import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/catalogue_navbar.dart';
import 'package:kidbank/features/catalogue/toy_details/toy_details_actions.dart';
import 'package:kidbank/features/catalogue/toy_details/toy_details_info.dart';
import 'package:kidbank/features/catalogue/toy_details/toy_details_tags.dart';

import '../../../core/colors.dart';

class ToyDetailsScreen extends StatelessWidget {
  const ToyDetailsScreen({super.key,this.isMyToy=false});
  final bool isMyToy;
  //TODO final Toy? toy;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CupertinoPageScaffold(
        backgroundColor: Colors.white100,
          child:SafeArea(
            child: Column(
              children: [
                const CatalogueNavbar(),
                Container(
                  padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8),
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: const Stack(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: MainBackButton(label: 'Back',)
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                          child: Text('Toy\'s title',style: TextStyle(fontWeight: FontWeight.w700),)
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*.4,
                            child: ListView.builder(
                                itemBuilder: (context,index){
                              return const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: ToyImage(),
                              );
                            },
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              shrinkWrap: true,
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const ToyDetailsInfo(),
                          const SizedBox(height: 8,),
                          const ToyDetailsTags(),
                          const SizedBox(height: 16,),
                          ToyDetailsActions(isMyToy: isMyToy,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
