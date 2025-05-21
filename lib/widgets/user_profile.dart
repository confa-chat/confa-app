import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/konfa/user/v1/user.pb.dart';

enum UserStatus { online, idle, doNotDisturb, offline }

class UserProfileWidget extends StatelessWidget {
  final User user;
  final UserStatus status;
  final bool showStatus;
  final VoidCallback? onTap;

  const UserProfileWidget({
    super.key,
    required this.user,
    this.status = UserStatus.offline,
    this.showStatus = true,
    this.onTap,
  });

  Widget _getStatus() {
    const double statusSize = 12;

    switch (status) {
      case UserStatus.online:
        return Icon(Icons.circle, size: statusSize, color: Colors.green);
      case UserStatus.idle:
        return Icon(Icons.mode_standby, size: statusSize, color: Colors.orange);
      case UserStatus.doNotDisturb:
        return Icon(Icons.do_not_disturb_on, size: statusSize, color: Colors.red);
      case UserStatus.offline:
        return Icon(Icons.circle, size: statusSize, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).highlightColor,
                    child: Icon(Icons.person, color: Theme.of(context).primaryColor),
                  ),
                  _getStatus(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  status.name,
                  style: TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
