import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_app/core/repo/property_repo_imp.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  PropertyRepoImp propertyRepoImp = PropertyRepoImp();

  // دالة للتحقق من حالة المفضلة عند تحميل الصفحة
  Future<void> checkFavoriteStatus({
    required String propertyId,
    required String userId,
  }) async {
    emit(FavoriteLoading());
    try {
      final isFavorite = await propertyRepoImp.isFavoriteExists({
        'propertyId': propertyId,
        'userId': userId,
      });

      emit(FavoriteSuccess(isFavorite));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  Future<void> addOrRemoveFavorite({
    required String propertyId,
    required String userId,
  }) async {
    emit(FavoriteLoading());
    try {
      final isFavorite = await propertyRepoImp.isFavoriteExists({
        'propertyId': propertyId,
        'userId': userId,
      });
      if (isFavorite) {
        // If the property is favorite, remove it
        await propertyRepoImp.removePropertyToFavorite({
          'propertyId': propertyId,
          'userId': userId,
        });
      } else {
        // If the property is not favorite, add it
        await propertyRepoImp.addPropertytToFavority({
          'propertyId': propertyId,
          'userId': userId,
        });
      }
      // نعكس النتيجة لأننا غيرنا حالة المفضلة
      emit(FavoriteSuccess(!isFavorite));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }
}
