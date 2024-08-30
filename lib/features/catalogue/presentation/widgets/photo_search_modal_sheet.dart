import 'package:flutter/widgets.dart';

import '../../../../core/images.dart';
import '../../../../core/widgets/custom_modal_bottom_sheet.dart';
import '../../../../core/widgets/ui_card.dart';

class PhotoSearchModalSheet extends StatelessWidget {

  const PhotoSearchModalSheet({super.key});
  static void showPhotoSearchModal(BuildContext context,{required String title}) {
    CustomModalBottomSheet.show(
        context: context,
        sheet: CustomModalBottomSheet(
          title: title,
          body: const PhotoSearchModalSheet(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //TODO onTap upload the photo
        UiCard.notSelectable(
          image: imagePurple,
          label: 'Upload the photo',
        ),
        const SizedBox(
          width: 16,
        ),
        //TODO onTap take the picture
        UiCard.notSelectable(
          image: cameraPurple,
          label: 'Take the picture',
        ),
      ],
    );
  }
}
