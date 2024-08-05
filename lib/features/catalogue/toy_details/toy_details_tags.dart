import 'package:flutter/cupertino.dart';

import '../../../core/widgets/tag.dart';

class ToyDetailsTags extends StatelessWidget {
  const ToyDetailsTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
          Tag(text: 'Stuffed toy',),
          Tag(text: 'Teddy',),
          Tag(text: 'Multicolor',),
          Tag(text: '3+',),
      ],
    );
  }
}
