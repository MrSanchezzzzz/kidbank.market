import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/mascot_image.dart';

class MascotInfo extends StatelessWidget {
  const MascotInfo({super.key,this.image,this.text});
  final Image? image;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16,),
        MascotImage(image: image,),
        const SizedBox(height: 16,),
        Text(text??'',style: CupertinoTheme.of(context).textTheme.textStyle,textAlign: TextAlign.center,)
      ],
    );
  }
}
