import 'package:flutter/src/widgets/image.dart';
import 'package:mafia_helper/features/domain/entities/active_role.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';

class Lover extends ActiveRole {

  @override
  void move(Role role) => gameService.mute(role);
}