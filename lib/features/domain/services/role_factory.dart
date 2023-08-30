import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/domain/entities/roles/citizen.dart';
import 'package:mafia_helper/features/domain/entities/roles/detective.dart';
import 'package:mafia_helper/features/domain/entities/roles/doctor.dart';
import 'package:mafia_helper/features/domain/entities/roles/killer.dart';
import 'package:mafia_helper/features/domain/entities/roles/lover.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia.dart';
import 'package:mafia_helper/features/domain/entities/roles/mafia_boss.dart';

class RoleFactory {

  static Role createRole<T>() {
    switch(T) {
      case Citizen: return Citizen();
      case MafiaBoss: return MafiaBoss();
      case Mafia : return Mafia();
      case Detective : return Detective();
      case Doctor : return Doctor();
      case Killer : return Killer();
      case Lover : return Lover();
    }
    return Citizen();
  }
}