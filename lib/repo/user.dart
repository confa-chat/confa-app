import 'package:konfa/gen/proto/konfa/hub/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/user/v1/user.pb.dart';

class UsersRepo {
  HubServiceClient hubClient;
  ServerServiceClient serverClient;

  String _currentUserId;

  String get currentUserId => _currentUserId;

  final _cache = <String, User>{};

  UsersRepo._create(this.hubClient, this.serverClient, this._currentUserId);

  static Future<UsersRepo> create(
    HubServiceClient hubClient,
    ServerServiceClient serverClient,
  ) async {
    final currentUserResp = await hubClient.currentUser(CurrentUserRequest());
    final repo = UsersRepo._create(hubClient, serverClient, currentUserResp.user.id);
    await repo.currentUser();
    return repo;
  }

  Future<void> loadServerUsers(String serverId) async {
    final resp = await serverClient.listServerUsers(ListServerUsersRequest(serverId: serverId));

    for (final user in resp.users) {
      _cache[user.id] = user;
    }
  }

  Future<User> getUser(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }

    final resp = await hubClient.getUser(GetUserRequest(id: id));
    _cache[id] = resp.user;

    return resp.user;
  }

  Future<User> currentUser() async {
    if (_cache.containsKey(_currentUserId)) {
      return _cache[_currentUserId]!;
    }

    final resp = await hubClient.currentUser(CurrentUserRequest());
    _currentUserId = resp.user.id;
    _cache[resp.user.id] = resp.user;
    return resp.user;
  }
}
