import '../models/survivor_node.dart';

class PeerManager {
  PeerManager();

  /// Stores all active peers.
  /// Key = SIG-ID
  final Map<String, SurvivorNode> _peers = {};

  /// Add a new peer.
  void addPeer(SurvivorNode peer) {
    _peers[peer.id] = peer;
  }

  /// Update an existing peer.
  void updatePeer(SurvivorNode peer) {
    _peers[peer.id] = peer;
  }

  /// Remove peer.
  void removePeer(String peerId) {
    _peers.remove(peerId);
  }

  /// Get peer by ID.
  SurvivorNode? getPeer(String peerId) {
    return _peers[peerId];
  }

  /// Get all peers.
  List<SurvivorNode> getAllPeers() {
    return _peers.values.toList();
  }

  /// Check if peer exists.
  bool containsPeer(String peerId) {
    return _peers.containsKey(peerId);
  }

  /// Total active peers.
  int get peerCount => _peers.length;

  /// Remove all peers.
  void clearPeers() {
    _peers.clear();
  }

  /// Remove inactive peers.
  ///
  /// Any peer not seen for more than [timeout]
  /// will be removed.
  void clearInactivePeers(Duration timeout) {
    final now = DateTime.now();

    _peers.removeWhere((_, peer) {
      return now.difference(peer.lastSeen) > timeout;
    });
  }
}