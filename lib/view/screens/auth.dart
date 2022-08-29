import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/domain/models/login_model.dart';
import 'package:local_dea_app/view/blocs/auth/auth.dart';
import 'package:local_dea_app/view/screens/register_dea.dart';
import 'package:local_dea_app/view/widgets/app_bar_content.dart';
import 'package:local_dea_app/view/widgets/custom_snackbar.dart';
import 'package:local_dea_app/view/widgets/field.dart';
import 'package:local_dea_app/view/widgets/search_dea_button.dart';
import 'package:local_dea_app/view/widgets/shader_gradient.dart';
import 'package:page_transition/page_transition.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool obscurePassword = false;
  late final AuthBloc authBloc;
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
    _formKey = GlobalKey<FormState>();
    _userController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Palette.redGradient1, Palette.redGradient2],
            ),
          ),
        ),
        title: const AppBarContent(
          title: 'Autenticação',
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocListener(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthFailedState) {
            CustomSnackBar.show(
              context,
              'Não foi possível realizar o login',
              success: false,
            );
          }
          if (state is AuthSucceedState) {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.scale,
                alignment: Alignment.center,
                child: const RegisterDeaScreen(),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Image.asset(
                  'assets/dea_icon.png',
                  width: 80,
                  height: 80,
                ),
                const ShaderGradient(
                  child: Text(
                    'Autenticação',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Para utilizar este serviço é necessário realizar o login no servidor SIGA.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                CustomFormField(
                  icon: FontAwesomeIcons.user,
                  label: 'Usuário',
                  controller: _userController,
                ),
                const SizedBox(height: 32),
                CustomFormField(
                  icon: Icons.password_outlined,
                  label: 'Senha',
                  suffixIcon:
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                  onTapSuffixIcon: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  obscureText: obscurePassword,
                  controller: _passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
            child: LocalDeaButton(
              onPress: () {
                if (_formKey.currentState?.validate() ?? false) {
                  authBloc.add(
                    AuthLoginEvent(
                      loginModel: LoginModel(
                        user: _userController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  );
                }
              },
              isLoading: state is AuthLoadingState,
              icon: FontAwesomeIcons.arrowRightToBracket,
              label: 'ENTRAR',
            ),
          );
        },
      ),
    );
  }
}
