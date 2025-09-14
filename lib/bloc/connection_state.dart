part of 'connection_cubit.dart';

@immutable
sealed class ConnectionState {}

/// Initial state
final class ConnectionInitial extends ConnectionState {}

/// Loading state
final class ConnectionLoading extends ConnectionState {}

final class ConnectionInfoLoaded extends ConnectionState {
  final List<NodeInfo> knownNodes;
  final NodeInfo selectedNode;
  final VersionInfo versionInfo;
  final List<AuthProvider> authProviders;

  ConnectionInfoLoaded({
    required this.knownNodes,
    required this.selectedNode,
    required this.versionInfo,
    required this.authProviders,
  });
}

final class ConnectionInfoAuthenticationInProgress
    extends ConnectionInfoLoaded {
  ConnectionInfoAuthenticationInProgress({
    required super.knownNodes,
    required super.selectedNode,
    required super.versionInfo,
    required super.authProviders,
  });
}

final class ConnectionInfoAuthenticated extends ConnectionInfoLoaded {
  final AuthState authState;

  ConnectionInfoAuthenticated({
    required super.knownNodes,
    required super.selectedNode,
    required super.versionInfo,
    required super.authProviders,
    required this.authState,
  });

  bool canConnect() {
    return versionInfo.supported;
  }
}

final class ConnectionInfoAuthenticationError extends ConnectionInfoLoaded {
  final String authError;

  ConnectionInfoAuthenticationError({
    required super.knownNodes,
    required super.selectedNode,
    required super.versionInfo,
    required super.authProviders,
    required this.authError,
  });
}

/// State when connection to hub fails
final class ConnectionError extends ConnectionState {
  final List<NodeInfo> knownNodes;
  final NodeInfo selectedNode;
  final VersionInfo? versionInfo;
  final AuthState? authState;
  final String error;

  ConnectionError({
    required this.knownNodes,
    required this.selectedNode,
    required this.error,
    this.versionInfo,
    this.authState,
  });
}
