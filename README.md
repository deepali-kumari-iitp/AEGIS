# AEGIS
# AEGIS 📡

## "When the internet dies, humanity still speaks."

**Build.IT '26 Hackathon** | Offline-First P2P Mesh Communication Platform

---

# Overview

AEGIS is an offline-first emergency communication platform that enables nearby devices to communicate without internet connectivity using peer-to-peer mesh networking. The platform combines WebRTC, mDNS discovery, cryptography, and local storage to provide secure communication during disasters or network outages.

---

# Architecture

```text
[Phone A] <--WebRTC--> [Phone B] <--WebRTC--> [Phone C]
          (Direct)         (Relay Node)
```

- Discovery: mDNS (_aegis._tcp)
- Signaling: Flask Relay Server
- Mesh Routing: Multi-hop with TTL & Deduplication
- Encryption: Ed25519 + AES-GCM-256
- Local Storage: Hive

---

# Tech Stack

- Flutter
- Dart
- WebRTC
- Flask
- Python
- Hive
- Riverpod
- Go Router
- mDNS
- Cryptography (Ed25519 + AES-GCM)

---

# Features

## Mesh Networking
- Multi-hop routing
- Packet TTL
- Duplicate packet prevention
- Offline peer-to-peer communication

## Emergency SOS
- GPS-enabled SOS
- Flood broadcasting
- Audio alerts
- Emergency categories

## Secure Chat
- End-to-end encrypted messages
- Offline message queue
- Delivery acknowledgement

## Survivor Radar
- Nearby device visualization
- Live status updates
- Custom radar interface

## Resource Sharing
- Food
- Water
- Medicine
- Shelter
- Volunteers
- Tools

---

# Quick Start

```bash
cd aegis_flutter
flutter pub get
```

Run Flask Server

```bash
cd server
pip install -r requirements.txt
python signal-relay.py
```

Run Flutter

```bash
flutter run
```

---

# Project Structure

```text
aegis_flutter/
 ├── lib/
 │   ├── core/
 │   ├── models/
 │   ├── providers/
 │   ├── services/
 │   ├── screens/
 │   └── widgets/
 ├── server/
 ├── android/
 └── ios/
```

---

# Team Members

| Name | Role |
|------|------|
| Kripashankar Yadav | Team Leader & Flutter UI/UX |
| Deepali Kumari | Core Networking & Backend |
| Bhoomi Sharma | Services & Application Logic |

---

# Responsibilities

## 👨‍💻 Kripashankar Yadav
### Team Leader & Flutter UI/UX

- Planned overall architecture and coordinated development.
- Developed Flutter application UI.
- Built Dashboard, Radar, Chat, SOS, Resource Feed, Network Map, Identity and Settings screens.
- Designed reusable widgets and custom painters.
- Implemented responsive UI, animations and navigation.
- Integrated Riverpod with Flutter UI.

### Modules
- Dashboard
- Chat UI
- SOS UI
- Resource Feed
- Radar
- Network Map
- Identity Screen
- Settings
- Widgets
- Custom Painters
- Navigation
- Theme
- Responsive Design

---

## 👩‍💻 Deepali Kumari
### Core Networking & Backend

- Designed the backend architecture for mesh networking.
- Implemented Mesh Router with multi-hop routing.
- Developed WebRTC communication layer.
- Built mDNS peer discovery.
- Implemented Flask Signaling Server.
- Developed Identity Management.
- Implemented packet routing with TTL and deduplication.
- Built secure communication using Ed25519 identities and AES-GCM encryption.

### Modules
- Mesh Router
- WebRTC Manager
- mDNS Discovery
- Flask Signaling Server
- Identity Manager
- Packet Routing
- Cryptography
- TTL Handling
- Deduplication

---

## 👩‍💻 Bhoomi Sharma
### Services & Application Logic

- Developed application service layer.
- Implemented encrypted chat logic.
- Built SOS service.
- Developed Status Beacon.
- Implemented Resource Manager.
- Built Offline Message Queue.
- Integrated Hive Local Storage.
- Added notifications and background services.
- Developed application models and providers.

### Modules
- Chat Service
- SOS System
- Status Beacon
- Resource Manager
- Offline Queue
- Hive Storage
- Notifications
- Background Services
- Models
- Providers

---

# Demo Scenarios

- Auto Device Discovery
- Three Device Mesh Relay
- Offline Chat
- Emergency SOS Broadcast
- Survivor Radar
- Resource Sharing

---

# Android Requirements

- Internet
- WiFi
- Multicast Lock
- Location
- Notifications
- Camera
- Foreground Service

---

# Build

```bash
flutter run --debug
flutter build apk --release
flutter install
```

---

# License

MIT License

---

# Status

✅ Backend Foundation Completed

✅ Flutter UI Completed

✅ Service Layer Completed

✅ Ready for Integration & Device Testing

---

Built for **Build.IT '26 Hackathon**
