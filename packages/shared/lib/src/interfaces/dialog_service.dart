import '../../shared.dart';

abstract class DialogService {
  Future<void> showAppDialog(DialogModel model);
  Future<void> showErrorMessage(String error);
  Future<void> confirmMessage(String message,void Function()? onTap);
  Future<void> showWarningMessage(String error);
  Future<void> showSuccessMessage(String massage);

}
