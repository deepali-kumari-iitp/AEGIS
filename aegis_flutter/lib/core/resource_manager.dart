import '../models/resource_item.dart';
import '../models/signal_packet.dart';
import 'mesh_router.dart';

class ResourceManager {
  ResourceManager({
    required MeshRouter meshRouter,
    required String selfId,
  })  : _meshRouter = meshRouter,
        _selfId = selfId;

  final MeshRouter _meshRouter;
  final String _selfId;

  final List<ResourceItem> _resources = [];

  List<ResourceItem> get resources =>
      List.unmodifiable(_resources);

  void addResource(ResourceItem item) {
    _resources.add(item);
  }

  void removeResource(String id) {
    _resources.removeWhere((e) => e.id == id);
  }

  ResourceItem? getResource(String id) {
    try {
      return _resources.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> broadcastResource(
    ResourceItem item,
  ) async {
    final packet = SignalPacket(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      from: _selfId,
      to: "ALL",
      type: PacketType.resource,
      payload: item.title,
      ttl: 5,
      hopCount: 0,
      path: [_selfId],
      timestamp: DateTime.now(),
      latitude: item.latitude,
      longitude: item.longitude,
      category: item.type.name,
    );

    await _meshRouter.sendPacket(packet);
  }

  void clear() {
    _resources.clear();
  }

  int get totalResources => _resources.length;
}