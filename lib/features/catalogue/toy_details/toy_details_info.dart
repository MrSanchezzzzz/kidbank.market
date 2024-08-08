import 'package:flutter/cupertino.dart';

class ToyDetailsInfo extends StatelessWidget {
  const ToyDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Toy\'s title',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontWeight: FontWeight.w700
            )),
              Text('50\$',style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle),
          ],
        ),
        const SizedBox(height: 8,),
        const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
      ],
    );
  }
}
