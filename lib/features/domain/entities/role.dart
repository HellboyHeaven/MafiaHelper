import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mafia_helper/features/domain/services/game_service.dart';
import 'package:mafia_helper/injection_container.dart';

class Role {
  @nonVirtual
  GameService gameService = getIt.get<GameService>();

  @nonVirtual
  void vote(Role role) => gameService.vote(role);
}