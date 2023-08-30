import 'package:flutter/widgets.dart';
import 'package:mafia_helper/features/domain/entities/active_role.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'mafia.dart';

class Detective extends ActiveRole {

  @override
  void move(Role role) => gameService.check<Mafia>(role);
}