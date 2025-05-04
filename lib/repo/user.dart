import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/user/v1/user.pb.dart';

class UsersRepo {
  ServerServiceClient client;

  String _currentUserId;

  String get currentUserId => _currentUserId;

  final _cache = <String, User>{};

  UsersRepo._create(this.client, this._currentUserId);

  static Future<UsersRepo> create(ServerServiceClient client) async {
    final resp = await client.currentUser(CurrentUserRequest());
    final repo = UsersRepo._create(client, resp.user.id);
    await repo.currentUser();
    return repo;
  }

  Future<void> loadServerUsers(String serverId) async {
    final resp = await client.listServerUsers(ListServerUsersRequest(serverId: serverId));

    for (final user in resp.users) {
      _cache[user.id] = user;
    }
  }

  Future<User> getUser(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }

    final resp = await client.getUser(GetUserRequest(userId: id));
    _cache[id] = resp.user;

    return resp.user;
  }

  Future<User> currentUser() async {
    if (_cache.containsKey(_currentUserId)) {
      return _cache[_currentUserId]!;
    }

    final resp = await client.currentUser(CurrentUserRequest());
    _currentUserId = resp.user.id;
    _cache[resp.user.id] = resp.user;
    return resp.user;
  }
}
