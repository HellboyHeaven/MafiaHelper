import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia_helper/features/domain/entities/role.dart';
import 'package:mafia_helper/features/presentation/bloc/role_list_state.dart';


class RoleListCubit extends Cubit<RoleListState> {
  RoleListCubit() : super(const RoleListState.loading());

  Future<void> fetchList(List<Role> roles) async => emit(RoleListState.success(roles));
}