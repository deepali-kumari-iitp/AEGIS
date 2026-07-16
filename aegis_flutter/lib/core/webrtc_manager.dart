import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../models/signal_packet.dart';
import '../services/signaling_service.dart';

class WebRTCManager {
  WebRTCManager();

  final SignalingService _signaling = SignalingService();

  RTCPeerConnection? _peerConnection;
  RTCDataChannel? _dataChannel;

  Function(SignalPacket packet)? onPacketReceived;

  bool get isConnected =>
      _peerConnection != null &&
      _dataChannel != null;

  Future<void> initialize() async {
    _peerConnection = await createPeerConnection(
      {
        "iceServers": [],
      },
    );

    _peerConnection!.onIceCandidate = (
      RTCIceCandidate candidate,
    ) async {
      await _signaling.sendIceCandidate(
        "peer",
        {
          "candidate": candidate.candidate,
          "sdpMid": candidate.sdpMid,
          "sdpMLineIndex": candidate.sdpMLineIndex,
        },
      );
    };

    _peerConnection!.onDataChannel = (
      RTCDataChannel channel,
    ) {
      _dataChannel = channel;

      _listenMessages();
    };
  }

  Future<void> createDataChannel() async {
    if (_peerConnection == null) return;

    _dataChannel = await _peerConnection!.createDataChannel(
      "mesh",
      RTCDataChannelInit(),
    );

    _listenMessages();
  }

  void _listenMessages() {
    _dataChannel?.onMessage =
        (RTCDataChannelMessage message) {
      try {
        final json = jsonDecode(message.text);

        final packet = SignalPacket.fromJson(json);

        onPacketReceived?.call(packet);
      } catch (_) {}
    };
  }

  Future<void> sendPacket(
    SignalPacket packet,
  ) async {
    if (_dataChannel == null) return;

    await _dataChannel!.send(
      RTCDataChannelMessage(
        jsonEncode(packet.toJson()),
      ),
    );
  }

  Future<void> dispose() async {
    await _dataChannel?.close();
    await _peerConnection?.close();

    _dataChannel = null;
    _peerConnection = null;
  }
}