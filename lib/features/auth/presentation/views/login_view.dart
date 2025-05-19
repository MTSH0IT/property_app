import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/build_snack_bar_message.dart';
import 'package:property_app/core/services/firebase_auth_services.dart';
import 'package:property_app/core/services/firestore_services.dart';
import 'package:property_app/core/widgets/custom_modal_progres.dart';
import 'package:property_app/features/auth/domain/repos/auth_repo_implementation.dart';
import 'package:property_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:property_app/features/auth/presentation/cubits/login/login_state.dart';
import 'package:property_app/features/auth/presentation/views/widget/login_view_body.dart';
import 'package:property_app/features/main_view.dart/presentation/views/main_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(
            AuthRepoImplementation(
              firebaseAuthServices: FirebaseAuthServices(),
              firestoreServices: FirestoreServices(),
            ),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('auth.login'.tr()),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              buildSnackBarMessage(
                context,
                'auth.login_success'.tr(),
                Colors.green,
              );
              Navigator.pushNamed(context, MainView.routeName);
            }
            if (state is LoginFailure) {
              buildSnackBarMessage(context, state.message, Colors.red);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: CustomModalProgress(
                inAsyncCall: state is LoginLoading,
                child: LoginViewBody(),
              ),
            );
          },
        ),
      ),
    );
  }
}
