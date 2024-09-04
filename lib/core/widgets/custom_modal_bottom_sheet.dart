import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart' as project_colors;
import '../images.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key, this.title,this.body});
  final String? title;
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Text(
                title??'',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: closeCircle,
                ),
              ),

            ],
          ),
          const SizedBox(height: 16,),
          if(body!=null)
            body!
        ],
      ),
    );
  }

  static void show({required BuildContext context,required CustomModalBottomSheet sheet}){
    showModalBottomSheet(
      isScrollControlled: true,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height*0.9,
        ),
        context: context,
        builder: (context) {
          return sheet;
        },
        backgroundColor: project_colors.Colors.white100);
  }
}
