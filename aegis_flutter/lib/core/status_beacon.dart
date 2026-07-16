import 'dart:async';

import '../models/signal_packet.dart';
import 'mesh_router.dart';

class StatusBeacon {
  StatusBeacon({
    required MeshRouter meshRouter,
    required String selfId,
  })  : _meshRouter = meshRouter,
        _selfId = selfId;

  final MeshRouter _meshRouter;
  final String _selfId;

  Timer? _timer;

  bool get isRunning => _timer != null;

  void start({
    Duration interval = const Duration(seconds: 10),
  }) {
    stop();

    _timer = Timer.periodic(interval, (_) {
      _broadcastStatus();
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _broadcastStatus() async {
    final packet = SignalPacket(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      from: _selfId,
      to: "ALL",
      type: PacketType.status,
      payload: "ONLINE",
      ttl: 5,
      hopCount: 0,
      path: [_selfId],
      timestamp: DateTime.now(),
    );

    await _meshRouter.sendPacket(packet);
  }
}