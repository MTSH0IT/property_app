import 'package:bloc/bloc.dart';
import 'package:property_app/core/repo/property_repo_imp.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/repo/storage_repo.dart';
import 'package:property_app/core/repo/storage_repo_imp.dart';

part 'add_property_state.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {
  AddPropertyCubit() : super(AddPropertyInitial());
  PropertyRepoImp propertyRepo = PropertyRepoImp();
  StorageRepo supabase = StorageRepoImp();
  Future<void> addProperty(PropertyEntity property) async {
    emit(AddPropertyLoading());
    try {
      if (property.images != null) {
        final url = await supabase.uploadImages(
          property.images!,
          'property-images',
        );
        property.imagesUrl = url;
        await propertyRepo.addProperty(property);
        emit(AddPropertySuccess());
      } else {
        await propertyRepo.addProperty(property);
        emit(AddPropertySuccess());
      }
    } catch (e) {
      emit(AddPropertyFailure(e.toString()));
    }
  }
}
