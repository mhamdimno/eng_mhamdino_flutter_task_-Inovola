import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/data/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:shared/shared.dart';

import 'package:ui/ui.dart';
import '../../../../../core/di/di.dart';
import '../../../categories/data/model/cateogory_model.dart';
import '../view_model/currency_cubit.dart';

class CurrencyComponant extends StatefulWidget {
  const CurrencyComponant({
    super.key,
    required this.onSelectItem,
  });
  final Function(CurrencyModel) onSelectItem;

  @override
  State<CurrencyComponant> createState() => _CurrencyComponantState();
}

class _CurrencyComponantState extends State<CurrencyComponant> {
  final CurrencyCubit _currencyCubit = getIt<CurrencyCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrencyCubit>(
        create: (context) => _currencyCubit..getCurrencyData(),
        child: BlocBuilder<CurrencyCubit, CurrencyState>(
            builder: (context, state) {
          return _currencyCubit.state.currencyList == null
              ? const SizedBox()
              : MultiDropdown<CurrencyModel>(
                  searchEnabled: true,
                  items: _currencyCubit.state.currencyList
                          ?.map((e) => DropdownItem(
                                value: e,
                                label: "${e.code} (${e.value})",
                              ))
                          .toList() ??
                      [],
                  onSelectionChange: (md) {
                    if (md.isEmpty) return;
                    widget.onSelectItem(md.first);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a currency';
                    }
                    return null;
                  },
                  fieldDecoration: FieldDecoration(
                      hintText: 'Select Currency',
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      backgroundColor: context.customColorStyle?.lightGrey),
                  singleSelect: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                );
        }));
  }
}
