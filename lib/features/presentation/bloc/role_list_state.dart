import 'package:equatable/equatable.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';


class RoleListState extends Equatable {
  const RoleListState._({
    this.roles = const <Role>[],
  });

  const RoleListState.loading() : this._();

  const RoleListState.success(List<Role> roles)
      : this._(roles: roles);

  final List<Role> roles;

  @override
  List<Object?> get props => [roles];
}