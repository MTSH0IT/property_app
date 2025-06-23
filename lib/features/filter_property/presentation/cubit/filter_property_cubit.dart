import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/entites/filter_entity.dart';
import 'package:property_app/core/repo/property_repo_imp.dart';
import 'package:property_app/core/utils/custom_exception.dart';

part 'filter_property_state.dart';

class FilterPropertyCubit extends Cubit<FilterPropertyState> {
  FilterPropertyCubit() : super(FilterPropertyInitial());
  PropertyRepoImp propertyRepo = PropertyRepoImp();

  Future<void> filterProperties(FilterEntity filter) async {
    emit(FilterPropertyLoading());
    try {
      final properties = await propertyRepo.filterProperties(filter);
      emit(FilterPropertySuccess(properties));
    } on CustomException catch (e) {
      log("cubit error: ${e.message}");
      emit(FilterPropertyFailure(e.message));
    } catch (e) {
      log("cubit error: ${e.toString()}");
      emit(FilterPropertyFailure(e.toString()));
    }
  }
}
