import 'package:flutter/cupertino.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/entities/roles/detective.dart';
import 'package:mafia_helper/features/domain/entities/roles/doctor.dart';
import 'package:mafia_helper/features/domain/entities/roles/killer.dart';
import 'package:mafia_helper/features/domain/entities/roles/lover.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia_boss.dart';
import 'package:mafia_helper/features/domain/services/role_service.dart';

import '../entities/roles/citizen.dart';

class RoleDefaultService implements RoleService {
  final _map = <Type, ImageProvider>{};


  RoleDefaultService() {
    _map[Citizen] = const AssetImage('assets/images/citizen.jpeg');
    _map[Mafia] = const AssetImage('assets/images/mafia.jpeg');
    _map[MafiaBoss] = const AssetImage('assets/images/mafiaBoss.jpeg');
    _map[Detective] = const AssetImage('assets/images/detective.jpeg');
    _map[Doctor] = const AssetImage('assets/images/doctor.jpeg');
    _map[Killer] = const AssetImage('assets/images/killer.jpeg');
    _map[Lover] = const AssetImage('assets/images/lover.jpeg');
  }

  @override
  ImageProvider getImage(Role? role) => _map[role.runtimeType] ?? const AssetImage('assets/images/diamond_ore.webp');

  @override
  ImageProvider getImageByType<T extends Role>() => _map[T] ?? const AssetImage('assets/images/diamond_ore.webp');



}