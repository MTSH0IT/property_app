import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:property_app/core/repo/property_repo_imp.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/utils/custom_exception.dart';

part 'get_property_state.dart';

class GetPropertyCubit extends Cubit<GetPropertyState> {
  GetPropertyCubit() : super(GetPropertyInitial());
  PropertyRepoImp propertyRepo = PropertyRepoImp();

  Future<void> getProperties() async {
    emit(GetPropertyLoading());
    try {
      final properties = await propertyRepo.getProperties();

      emit(GetPropertySuccess(properties));
    } on CustomException catch (e) {
      log(" cubit error: ${e.message}");

      emit(GetPropertyFailure(e.message));
    } catch (e) {
      log(" cubit error: ${e.toString()}");

      emit(GetPropertyFailure(e.toString()));
    }
  }
}
