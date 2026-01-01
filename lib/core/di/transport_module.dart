import 'package:connectrpc/connect.dart';
import 'package:injectable/injectable.dart';

import '../transport/connect_transport.dart';

/// Injectable module for providing ConnectRPC Transport.
@module
abstract class TransportModule {
  @lazySingleton
  Transport get transport => createTransport();
}
