import 'package:flutter/widgets.dart';
import 'package:mafia_helper/features/domain/entities/roles/detective.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia.dart';
import '../role.dart';

class MafiaBoss extends Mafia {

  @override
  void move(Role role) => gameService.check<Detective>(role);
}