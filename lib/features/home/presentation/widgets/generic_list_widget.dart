import 'package:flutter/cupertino.dart';

class GenericListWidget<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;

  const GenericListWidget({
    Key? key,
    required this.items,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) => itemBuilder(item)).toList(),
      ),
    );
  }
}
