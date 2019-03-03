import 'package:meta/meta.dart';

class Thread {
  final bool fromSelf;
  final String message;

  Thread({@required bool fromSelf, @required String message})
      : fromSelf = fromSelf ?? true,
        message = message ?? '';
}
