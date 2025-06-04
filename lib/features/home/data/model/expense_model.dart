import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/data/model/currency_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';
import 'package:eng_mhamdino_flutter_task/features/login/data/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

import '../../../dropdowns/categories/data/model/cateogory_model.dart';

@Entity()
class ExpenseModel {
  @Id()
  int? id;
  double? originalAmount;
  double? convertedAmount;
  String? date;
  DateTime? dateSelected;
  String? image;
  DateTime createdAt; // This will be used for sorting

  final category = ToOne<CateogoryModel>();
  final currency = ToOne<CurrencyModel>();

  // Corrected constructor
  ExpenseModel({
    this.id,
    this.originalAmount,
    this.convertedAmount,
    this.dateSelected,
    this.date,
    this.image, // Don't forget to include image if it's a property
    DateTime? createdAt, // Make it nullable if you want to explicitly pass it
  }) : createdAt = createdAt ?? DateTime.now();

  String get formatedAmount =>
      '${convertedAmount?.toStringAsFixed(2)} \$\n - ${originalAmount?.toStringAsFixed(2)} EGP'; // This line sets the default
}
