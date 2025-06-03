import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/src/interfaces/id_device_service.dart';

@Injectable(as: DeviceIdService)
class DeviceIdServiceImplement extends DeviceIdService {
  @override
  Future<String> getDeviceId() async {
    String uniqueDeviceId = '';

    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uniqueDeviceId = '${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uniqueDeviceId = '${androidDeviceInfo.id}'; // unique ID on Android
    }

    return uniqueDeviceId;
  }
}
