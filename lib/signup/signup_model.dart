import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  Local state fields for this page.

  String language = 'en';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Contactnumber widget.
  FocusNode? contactnumberFocusNode;
  TextEditingController? contactnumberTextController;
  String? Function(BuildContext, String?)? contactnumberTextControllerValidator;
  // State field(s) for plant widget.
  FocusNode? plantFocusNode;
  TextEditingController? plantTextController;
  String? Function(BuildContext, String?)? plantTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Createpassword widget.
  FocusNode? createpasswordFocusNode;
  TextEditingController? createpasswordTextController;
  late bool createpasswordVisibility;
  String? Function(BuildContext, String?)?
      createpasswordTextControllerValidator;
  // State field(s) for confirmpassword widget.
  FocusNode? confirmpasswordFocusNode;
  TextEditingController? confirmpasswordTextController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    createpasswordVisibility = false;
    confirmpasswordVisibility = false;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    contactnumberFocusNode?.dispose();
    contactnumberTextController?.dispose();

    plantFocusNode?.dispose();
    plantTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    createpasswordFocusNode?.dispose();
    createpasswordTextController?.dispose();

    confirmpasswordFocusNode?.dispose();
    confirmpasswordTextController?.dispose();
  }
}
