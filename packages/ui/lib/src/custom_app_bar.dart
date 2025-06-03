import 'package:flutter/material.dart';
import '../ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
      this.appBarHeight,
      this.leading,
      this.title,
      this.hasBackButton = true});

  double? appBarHeight;
  Widget? leading;
  String? title;
  bool? hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.customColorStyle!.primary),
      height: appBarHeight ?? 140,
      child: Padding(
        padding: const EdgeInsets.only(top: 55, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasBackButton == true
                ? InkWell(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: context.customColorStyle!.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: context.customColorStyle!.white!,
                            width: 0.4),
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_new,
                            color: context.customColorStyle!.white, size: 16),
                      ),
                    ),
                  )
                : 48.widthBox,
            Center(
              child: AppText(
                 title ?? '',
                style: context.textTheme.bodyLarge!
                    .copyWith(color: context.customColorStyle!.white),
              ),
            ),
            leading ?? 48.widthBox,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 80);
}
