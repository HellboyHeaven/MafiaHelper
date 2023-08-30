import 'package:mafia_helper/features/domain/entities/role.dart';

abstract class ActiveRole extends Role {
  bool canMove = false;
  void move(Role role);
}