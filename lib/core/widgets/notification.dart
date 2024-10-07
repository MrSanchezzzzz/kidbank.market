import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:overlay_support/overlay_support.dart';

import '../colors.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key, this.title, this.text, this.child});

  final String? title;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlideDismissible(
        key: const ValueKey('custom_notification'), // Unique key for each notification
        direction: DismissDirection.horizontal, // Horizontal dismiss (left or right)
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              // If user swiped up, dismiss the notification
              OverlaySupportEntry.of(context)?.dismiss();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange300)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/notification_avatar.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'KidBank',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                              color: Colors.orange500,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              OverlaySupportEntry.of(context)
                                  ?.dismiss(animate: true);
                            },
                            child: Image.asset(
                              'assets/images/back_cross.png',
                              width: 16,
                              height: 16,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                if (title != null)
                  Text(title!,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(fontWeight: FontWeight.w700)),
                if (text != null)
                  Text(
                    text!,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 15),
                  ),
                if (child != null) child!
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context,{String? title,String? text,Widget? child}) {
    showOverlayNotification(
          (context) {
        return CustomNotification(
          title: title,
          text: text,
          child: child,
        );
      },
      duration: const Duration(seconds: 3),
    );
  }
}
