import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/helper_functions/build_snack_bar_message.dart';
import 'package:property_app/core/server/firebase_auth_services.dart';
import 'package:property_app/core/server/firestore_services.dart';
import 'package:property_app/core/widgets/custom_modal_progres.dart';
import 'package:property_app/features/auth/domen/repos/auth_repo_implementation.dart';
import 'package:property_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:property_app/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:property_app/features/auth/presentation/views/widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SignupCubit(
            AuthRepoImplementation(
              firebaseAuthServices: FirebaseAuthServices(),
              firestoreServices: FirestoreServices(),
            ),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("auth.sign_up".tr()),
          leading: SizedBox(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              buildSnackBarMessage(
                context,
                "auth.sign_up_success".tr(),
                Colors.green,
              );
              Navigator.pop(context);
            }
            if (state is SignupFailure) {
              buildSnackBarMessage(context, state.message, Colors.red);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: CustomModalProgress(
                inAsyncCall: state is SignupLoading,
                child: SignupViewBody(),
              ),
            );
          },
        ),
      ),
    );
  }
}
