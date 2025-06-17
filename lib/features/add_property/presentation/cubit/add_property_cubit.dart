import 'package:bloc/bloc.dart';
//import 'package:meta/meta.dart';
import 'package:property_app/core/services/firestore_services.dart';
import 'package:property_app/features/add_property/data/models/property_model.dart';
import 'package:property_app/features/add_property/domain/entites/property_entity.dart';

part 'add_property_state.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial());

  Future<void> addProperty(PropertyEntity property) async {
    emit(AddPropertyLoading());
    try {
      await FirestoreServices().addData(
        path: 'properties',
        data: PropertyModel.fromEntity(property).toJson(),
      );
      emit(AddPropertySuccess());
    } catch (e) {
      emit(AddPropertyFailure(e.toString()));
    }
  }
}
