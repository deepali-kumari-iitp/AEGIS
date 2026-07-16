import '../models/signal_packet.dart';
import 'message_queue.dart';
import 'peer_manager.dart';
import 'webrtc_manager.dart';

class MeshRouter {
  MeshRouter({
    required PeerManager peerManager,
    required WebRTCManager webRtcManager,
    required MessageQueue messageQueue,
  })  : _peerManager = peerManager,
        _webRtcManager = webRtcManager,
        _messageQueue = messageQueue;

  final PeerManager _peerManager;
  final WebRTCManager _webRtcManager;
  final MessageQueue _messageQueue;

  /// Packet IDs already processed.
  final Set<String> _processedPackets = {};

  /// Maximum cache size.
  static const int _cacheLimit = 1000;

  /// Entry point for incoming packets.
  Future<void> receivePacket(SignalPacket packet) async {
    // Duplicate packet
    if (_processedPackets.contains(packet.id)) {
      return;
    }

    _processedPackets.add(packet.id);

    if (_processedPackets.length > _cacheLimit) {
      _processedPackets.remove(_processedPackets.first);
    }

    // TTL expired
    if (packet.ttl <= 0) {
      return;
    }

    // Destination reached
    if (_isDestination(packet)) {
      await _deliverPacket(packet);
      return;
    }

    // Forward packet
    await relayPacket(packet);
  }

  /// Relay packet to neighbors.
  Future<void> relayPacket(SignalPacket packet) async {
    if (!_webRtcManager.isConnected) {
      _messageQueue.enqueue(packet);
      return;
    }

    final forwarded = packet.copyWith(
      ttl: packet.ttl - 1,
      hopCount: packet.hopCount + 1,
      path: [
        ...packet.path,
      ],
    );

    await _webRtcManager.sendPacket(forwarded);
  }

  /// Send a brand-new packet.
  Future<void> sendPacket(SignalPacket packet) async {
    if (!_webRtcManager.isConnected) {
      _messageQueue.enqueue(packet);
      return;
    }

    await _webRtcManager.sendPacket(packet);
  }

  /// Retry queued packets.
  Future<void> flushQueue() async {
    while (!_messageQueue.isEmpty) {
      final packet = _messageQueue.dequeue();

      if (packet == null) break;

      await sendPacket(packet);
    }
  }

  /// Deliver packet locally.
  Future<void> _deliverPacket(
    SignalPacket packet,
  ) async {
    switch (packet.type) {
      case PacketType.chat:
        break;

      case PacketType.sos:
        break;

      case PacketType.status:
        break;

      case PacketType.resource:
        break;

      case PacketType.ack:
        break;
    }
  }

  bool _isDestination(SignalPacket packet) {
    return _peerManager.containsPeer(packet.to) == false;
  }

  void clearCache() {
    _processedPackets.clear();
  }

  int get processedPacketCount =>
      _processedPackets.length;
}