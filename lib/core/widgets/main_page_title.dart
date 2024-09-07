import 'package:flutter/cupertino.dart';
import 'package:kidbank/features/catalogue/presentation/widgets/photo_search_modal_sheet.dart';

import '../../features/catalogue/presentation/widgets/filter_modal_sheet.dart';
import 'custom_text_field.dart';
import 'filter/filter_button.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({super.key,this.title='',this.showPhotoSearch=false, this.trailing,this.onSearch,this.onPhotoSearch});
  final String title;
  final bool showPhotoSearch;
  final Widget? trailing;
  final Function()? onPhotoSearch;
  final Function()? onSearch;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoTheme.of(context).barBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontSize: 34),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField.search(
                    onCameraTap: (){
                      PhotoSearchModalSheet.showPhotoSearchModal(context, title: 'Photo search');
                    },
                    showCamera: showPhotoSearch,
                  ),
                ),
                Padding(
                  padding: trailing!=null?const EdgeInsets.only(left: 18,top: 12):const EdgeInsets.all(0),
                  child: trailing
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
