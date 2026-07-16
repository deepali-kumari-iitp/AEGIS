import '../models/signal_packet.dart';
import 'mesh_router.dart';

class SOSHandler {
  SOSHandler({
    required MeshRouter meshRouter,
    required String selfId,
  })  : _meshRouter = meshRouter,
        _selfId = selfId;

  final MeshRouter _meshRouter;
  final String _selfId;

  Future<void> sendSOS({
    required double latitude,
    required double longitude,
    String message = "Emergency!",
  }) async {
    final packet = SignalPacket(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      from: _selfId,
      to: "ALL",
      type: PacketType.sos,
      payload: message,
      ttl: 10,
      hopCount: 0,
      path: [_selfId],
      timestamp: DateTime.now(),
      latitude: latitude,
      longitude: longitude,
    );

    await _meshRouter.sendPacket(packet);
  }
}