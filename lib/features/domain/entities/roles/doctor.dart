import 'package:flutter/src/widgets/image.dart';
import 'package:mafia_helper/features/domain/entities/active_role.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';

class Doctor extends ActiveRole {

  @override
  void move(Role role) => gameService.heal(role);


}