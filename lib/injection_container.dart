import 'package:get_it/get_it.dart';
import 'package:mafia_helper/features/domain/services/game_default_service.dart';
import 'package:mafia_helper/features/domain/services/game_service.dart';
import 'package:mafia_helper/features/domain/services/role_deafault_service.dart';
import 'package:mafia_helper/features/domain/services/role_service.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<GameService>(GameDefaultService());
  getIt.registerSingleton<RoleService>(RoleDefaultService());
}