import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../data/dto/login_dto.dart';
import '../view_model/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final LoginBloc _loginBloc = getIt<LoginBloc>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final NavigationService _navigationService = getIt<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColorStyle!.white,
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, state) {
            return state.isLoading
                ? const AppLoading()
                // Show error message if exists
                : state.errorMessage != null
                    ? Center(
                        child: AppText(state.errorMessage!)
                            .setAnimation(AnimateType.bounceInDown),
                      )
                    : SingleChildScrollView(
                        child: AppPadding(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              100.heightBox,
                              Text(
                                // Using textTheme
                                'Expenset.',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF4A68FF),
                                    ),
                              ).setAnimation(
                                AnimateType.bounceInLeft,
                              ),
                              const SizedBox(height: 80),
                              AppText(
                                // Using textTheme
                                'Login',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              24.heightBox,
                              _buildLoginContent(context, state),
                            ],
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context, LoginState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            onChanged: _onFormChanged,
            child: Column(
              children: [
                16.heightBox,
                AppTopTextInputField(
                    topText: "Email",
                    child: _buildEmailField(context, state).setAnimation(
                      AnimateType.slideInUp,
                    )),
                16.heightBox,
                AppTopTextInputField(
                    topText: "Password",
                    child: _buildPasswordField(context, state).setAnimation(
                      AnimateType.slideInDown,
                    )),
                16.heightBox,
              ],
            ),
          ),
          _buildLoginButton(context, state),
          24.heightBox,
          _buildVistorButton(context, state),
        ],
      ),
    );
  }

  AppTextInputField _buildEmailField(BuildContext context, LoginState state) {
    return AppTextInputField(
      controller: _emailController,
      validator: AppFormValidator().isEmail("Email is not valid").validate,
      hintText: "Enter your email",
      labelText: "Email",
      keyboardType: TextInputType.emailAddress,
    );
  }

  AppPasswordInputField _buildPasswordField(
    BuildContext context,
    LoginState state,
  ) {
    return AppPasswordInputField(
      controller: _passwordController,
      validator: AppFormValidator()
          .isPassword("Password must be at least 6 characters")
          .validate,
      hintText: 'Enter your Password',
      labelText: 'Password',
    );
  }

  void _onFormChanged() {
    _loginBloc.add(
        LoginEvent.isFormValid(isValid: _formKey.currentState!.validate()));
  }

  Widget _buildLoginButton(BuildContext context, LoginState state) {
    return AppButton(
      isLoading: state.isLoading,
      text: "Login",
      disabled: !state.isFormValid,
      type: ButtonType.primary,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _loginBloc.add(LoginEvent.loginPressed(
              loginDto: LoginDto(
            email: _emailController.text.trim(),
          )));
        }
      },
    ).setAnimation(
      AnimateType.moveX,
      delay: AppAnimations.delay_s1,
    );
  }

  Widget _buildVistorButton(BuildContext context, LoginState state) {
    return AppButton(
      text: "Login as Visitor",
      type: ButtonType.text,
      onTap: () {
        _navigationService.replaceRoute(
          AppRoutes.home,
        );
      },
    );
  }
}
