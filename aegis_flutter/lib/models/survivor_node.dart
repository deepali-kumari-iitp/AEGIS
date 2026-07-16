enum SurvivorStatus {
  safe,
  needHelp,
  haveResources,
}

class SurvivorNode {
  final String id;
  final String displayName;
  final SurvivorStatus status;

  final double latitude;
  final double longitude;

  final DateTime lastSeen;

  final int hopDistance;

  final int batteryLevel;

  final bool isDirectPeer;

  final String publicKey;

  const SurvivorNode({
    required this.id,
    required this.displayName,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.lastSeen,
    required this.hopDistance,
    required this.batteryLevel,
    required this.isDirectPeer,
    required this.publicKey,
  });
}