import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:eng_mhamdino_flutter_task/core/router/bottom_sheets/bottom_sheets_routs.dart';

import 'package:shared/shared.dart';

@Injectable(as: BottomSheetRouteGenerator)
class BottomSheetsRouteGeneratorImpl extends BottomSheetRouteGenerator {
  @override
  Map<String, BottomSheetRoute> generateRoute() {
    return <String, BottomSheetRoute>{
      // BottomSheetRoutes.filterBottomSheet: (Object? arguments) => InquiryScreen(
      //       complainDto: arguments as ComplainDto,
      //     ), // Add
      BottomSheetRoutes.filterBottomSheet: (Object? arguments) =>
          const SizedBox(), // Add
    };
  }
}
