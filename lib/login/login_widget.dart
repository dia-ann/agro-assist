import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'login_model.dart';
export 'login_model.dart';

// Simplified, stable login page implementation to replace a corrupted, deeply-nested
// generated widget. This keeps existing model wiring so other code continues to work.

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());
    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFD3F3A6),
        body: SafeArea(
          child: Stack(
            children: [
              // Background image filling the safe area
              Positioned.fill(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/download_(3).jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Top-right circular logo
              Positioned(
                top: 12.0,
                right: 12.0,
                child: CircleAvatar(
                  radius: min(screenWidth * 0.08, 36.0),
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      const AssetImage('assets/images/ideaslogo.jpg'),
                ),
              ),

              // Foreground scrollable content
              Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 24.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 24.0,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: min(screenWidth * 0.95, 420.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 6.0),

                        // Email
                        TextFormField(
                          controller: _model.emailTextController,
                          focusNode: _model.emailFocusNode,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context)
                                .getText('lwrss5hf' /* Email */),
                            filled: true,
                            fillColor: const Color(0xFF06413A),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12.0),

                        // Password
                        TextFormField(
                          controller: _model.passwordTextController,
                          focusNode: _model.passwordFocusNode,
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context)
                                .getText('xmy4u795' /* Password */),
                            filled: true,
                            fillColor: const Color(0xFF0C433D),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            suffixIcon: IconButton(
                              icon: Icon(_model.passwordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () => setState(() =>
                                  _model.passwordVisibility =
                                      !_model.passwordVisibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18.0),

                        // Sign in button
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            final user = await authManager.signInWithEmail(
                              context,
                              _model.emailTextController.text,
                              _model.passwordTextController.text,
                            );
                            if (user == null) return;
                            _model.userDoc = await UserRecord.getDocumentOnce(
                                currentUserReference!);
                            setAppLanguage(
                                context,
                                valueOrDefault(
                                    currentUserDocument?.language, ''));
                            context.pushNamedAuth(
                                DashboardWidget.routeName, context.mounted);
                          },
                          text: FFLocalizations.of(context)
                              .getText('4r0760l0' /* Sign in */),
                          options: const FFButtonOptions(
                              height: 50.0, color: Color(0xFF1B3F3B)),
                        ),

                        const SizedBox(height: 12.0),

                        // Google auth
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            final user =
                                await authManager.signInWithGoogle(context);
                            if (user == null) return;
                            context.pushNamedAuth(
                                DashboardWidget.routeName, context.mounted);
                          },
                          text: FFLocalizations.of(context)
                              .getText('fvu7nzlo' /* Continue with Google */),
                          icon: const FaIcon(FontAwesomeIcons.google),
                          options: const FFButtonOptions(
                              height: 56.0, color: Color(0xFF03433D)),
                        ),

                        const SizedBox(height: 12.0),

                        // Links: Forgot password / Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () async {
                                if (_model.emailTextController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Email required')));
                                  return;
                                }
                                await authManager.resetPassword(
                                    email: _model.emailTextController.text,
                                    context: context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Password reset link sent')));
                              },
                              child: Text(FFLocalizations.of(context)
                                  .getText('pml3cme7' /* Forgot Password? */)),
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.pushNamed(SignupWidget.routeName),
                              child: Text(FFLocalizations.of(context)
                                  .getText('qxfzifns' /* Sign Up */)),
                            ),
                          ],
                        ),
                        // end Column children
                      ],
                    ),
                    // end Column
                  ),
                  // end ConstrainedBox
                ),
                // end SingleChildScrollView
              ),
              // end Center
            ],
            // end Stack children
          ),
          // end Stack
        ),
        // end SafeArea
      ),
      // end Scaffold
    );
  }
}
