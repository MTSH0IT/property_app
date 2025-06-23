import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_app/core/entites/property_entity.dart';
import 'package:property_app/core/helper_functions/get_user_data.dart';
import 'package:property_app/core/repo/property_repo_imp.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(GetFavoriteInitial());
  PropertyRepoImp propertyRepoImp = PropertyRepoImp();
  // دالة لجلب قائمة المفضلة
  Future<void> getFavoriteList({required String userId}) async {
    emit(GetFavoriteLoading());
    try {
      // استدعاء الدالة لجلب قائمة المفضلة من الريبو
      final favoriteProperties = await propertyRepoImp.getPropertiesFavorite(
        getUserData().uId,
      );
      emit(GetFavoriteSuccess(favoriteProperties));
    } catch (e) {
      emit(GetFavoriteFailure(e.toString()));
    }
  }
}
