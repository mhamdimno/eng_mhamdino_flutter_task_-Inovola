// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppList extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final void Function()? onLoadMore;
  final bool isLoadingMore;

  const AppList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.onLoadMore,
    this.isLoadingMore = false,
  });

  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.onLoadMore != null) {
      _scrollController.addListener(_scrollListener);
    }
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      if (currentScroll >= (maxScroll * 0.9)) {
        // User has scrolled to 90% of the list
        widget.onLoadMore!();
      } //
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      padding: EdgeInsets.zero,
      controller: _scrollController,
      itemCount: widget.itemCount + (widget.isLoadingMore ? 1 : 0),
      itemBuilder: ((BuildContext context, int index) {
        if (widget.isLoadingMore && widget.itemCount == index)
          return const AppLoading();
        return widget.itemBuilder(context, index);
      }),
    );
  }
}
