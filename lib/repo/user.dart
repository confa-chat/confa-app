import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/user/v1/user.pb.dart';

class UserRepo {
  ServerServiceClient client;
  final _cache = <String, User>{};

  UserRepo(this.client);

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
}
