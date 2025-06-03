import 'package:objectbox/objectbox.dart';

@Entity()
class CateogoryModel {
  @Id()
  int? id;
  String? title;
  String? iconName;
  int? sortOrder; // New field for manual ordering

  CateogoryModel({
    this.id,
    this.title,
    this.iconName,
    this.sortOrder,
  });
}
