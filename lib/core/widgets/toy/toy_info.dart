import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../colors.dart';

class ToyInfo extends StatelessWidget {
  const ToyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.replace(
          replacement: const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Bone.text(width: 120,),
          ),
          child: Text('In new condition',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 13,
              color: Colors.green200
          ),),
        ),
        const SizedBox(height: 4,),
        Row(
          children: [
            Skeleton.replace(
                replacement: const Bone.circle(size: 20,),
                child: Image.asset('assets/images/dracoin.png',width: 26,height: 26,)
            ),
            const SizedBox(width: 4,),
            Skeleton.replace(
              replacement: const Bone.text(width: 35,),
              child: Text('120',style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 16,color: Colors.grey400
              ),),
            )
          ],
        )
      ],
    );
  }
}
