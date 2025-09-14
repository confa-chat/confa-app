import 'package:confa/gen/proto/confa/node/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/server/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/user/v1/user.pb.dart';

class UsersRepo {
  NodeServiceClient nodeClient;
  ServerServiceClient serverClient;

  String _currentUserId;

  String get currentUserId => _currentUserId;

  final _cache = <String, User>{};

  UsersRepo._create(this.nodeClient, this.serverClient, this._currentUserId);

  static Future<UsersRepo> create(
    NodeServiceClient nodeClient,
    ServerServiceClient serverClient,
  ) async {
    final currentUserResp = await nodeClient.currentUser(CurrentUserRequest());
    final repo = UsersRepo._create(
      nodeClient,
      serverClient,
      currentUserResp.user.id,
    );
    await repo.currentUser();
    return repo;
  }

  Future<void> loadServerUsers(String serverId) async {
    final resp = await serverClient.listUsers(
      ListUsersRequest(serverId: serverId),
    );

    for (final user in resp.users) {
      _cache[user.id] = user;
    }
  }

  Future<User> getUser(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }

    final resp = await nodeClient.getUser(GetUserRequest(id: id));
    _cache[id] = resp.user;

    return resp.user;
  }

  Future<User> currentUser() async {
    if (_cache.containsKey(_currentUserId)) {
      return _cache[_currentUserId]!;
    }

    final resp = await nodeClient.currentUser(CurrentUserRequest());
    _currentUserId = resp.user.id;
    _cache[resp.user.id] = resp.user;
    return resp.user;
  }
}
