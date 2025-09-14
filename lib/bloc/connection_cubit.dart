import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:confa/auth/auth.dart';
import 'package:confa/gen/proto/confa/node/v1/auth_provider.pb.dart';
import 'package:confa/services/connection_manager.dart';

part 'connection_state.dart';

class NodeInfo {
  final String name;
  final Uri address;

  NodeInfo({required this.name, required this.address});
}

class ConnectionCubit extends Cubit<ConnectionState> {
  final HubsManager _hubsManager;

  // Known Nodes
  final List<NodeInfo> _knownNodes = [
    if (kDebugMode) NodeInfo(name: "Local Node", address: Uri.parse("http://localhost:38100")),
    NodeInfo(name: "Konfach", address: Uri.parse("https://confa-node.konfach.ru")),
  ];

  late NodeInfo _selectedNode;

  ConnectionCubit(this._hubsManager) : super(ConnectionInitial()) {
    _selectedNode = _knownNodes.first;
  }

  Future<void> connectToNode([NodeInfo? node]) async {
    emit(ConnectionLoading());

    try {
      _selectedNode = node ?? _knownNodes.first;

      final versionState = await _hubsManager.checkVersion(_selectedNode.address);
      final authProviders = await _hubsManager.listAuthProvidersOnHub(_selectedNode.address);
      final savedAuthState = await _hubsManager.tryLoadSavedAuth(_selectedNode.address);

      if (savedAuthState == null) {
        emit(
          ConnectionInfoLoaded(
            knownNodes: _knownNodes,
            selectedNode: _selectedNode,
            authProviders: authProviders,
            versionInfo: versionState,
          ),
        );
      } else {
        emit(
          ConnectionInfoAuthenticated(
            knownNodes: _knownNodes,
            selectedNode: _selectedNode,
            authProviders: authProviders,
            versionInfo: versionState,
            authState: savedAuthState,
          ),
        );
      }
    } catch (e) {
      emit(
        ConnectionError(
          knownNodes: _knownNodes,
          selectedNode: _knownNodes.first,
          error: 'Connection error: $e',
        ),
      );
    }
  }

  Future<void> authenticateWithProvider(AuthProvider provider) async {
    final versionState = await _hubsManager.checkVersion(_selectedNode.address);
    final authProviders = await _hubsManager.listAuthProvidersOnHub(_selectedNode.address);

    emit(
      ConnectionInfoAuthenticationInProgress(
        knownNodes: _knownNodes,
        selectedNode: _selectedNode,
        authProviders: authProviders,
        versionInfo: versionState,
      ),
    );

    final authState = await HubsManager().authOnProvider(_selectedNode.address, provider);

    emit(
      ConnectionInfoAuthenticated(
        knownNodes: _knownNodes,
        selectedNode: _selectedNode,
        authProviders: authProviders,
        versionInfo: versionState,
        authState: authState,
      ),
    );
  }

  Future<void> signOut() async {
    _hubsManager.clearSavedAuth(_selectedNode.address);
    connectToNode(_selectedNode);
  }
}
