import 'package:flutter/foundation.dart' show kReleaseMode;

extension boolsExtentions on bool {
  bool if_release(bool v) => kReleaseMode ? v : this;
}
