import 'package:bloc/bloc.dart';
import 'package:property_app/core/repo/property_repo_imp.dart';
import 'package:property_app/core/entites/property_entity.dart';

part 'add_property_state.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial());
  PropertyRepoImp propertyRepo = PropertyRepoImp();
  Future<void> addProperty(PropertyEntity property) async {
    emit(AddPropertyLoading());
    try {
      await propertyRepo.addProperty(property);
      emit(AddPropertySuccess());
    } catch (e) {
      emit(AddPropertyFailure(e.toString()));
    }
  }
}
