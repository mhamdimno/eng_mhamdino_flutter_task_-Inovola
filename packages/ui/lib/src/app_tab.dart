// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppTabs extends StatefulWidget {
  AppTabs({
    super.key,
    required this.values,
    required this.disabledColor,
    this.initSelected = 0,
    required this.onPressed,
    this.isScrollable = false,
    this.isExpanded = false,
    this.itemsSpacing = 8,
  });

  final int initSelected;
  final List<String> values;
  final Color disabledColor;
  final Function(int selected) onPressed;
  final bool isScrollable;
  final bool isExpanded;
  final double itemsSpacing;

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.initSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    widget.values.forEachIndexed((index, element) {
      children.add(_buildTabBarItem(index, selectedIndex == index, context));
      if (index < widget.values.length - 1) {
        children.add(widget.itemsSpacing.widthBox);
      }
    });
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
        shrinkWrap: false,
      ),
    );
  }

  Widget _buildTabBarItem(int index, bool isSelected, BuildContext context) {
    final Widget item = GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        widget.onPressed(index);
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: AppCorners.xlgBorder,
            color: isSelected
                ? context.customColorStyle?.primary
                : widget.disabledColor,
          ),
          child: _buildTabTitle(isSelected, index, context)),
    );

    if (widget.isExpanded) return Expanded(child: item);
    return item;
  }

  AppText _buildTabTitle(bool isSelected, int index, BuildContext context) {
    return AppText(
      widget.values[index],
      style: context.textTheme.bodySmall?.copyWith(
          color: isSelected
              ? context.customColorStyle?.white
              : context.customColorStyle?.primary,
          fontWeight: FontWeight.w600),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
