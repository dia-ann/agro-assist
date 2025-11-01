import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'update_profile_widget.dart' show UpdateProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateProfileModel extends FlutterFlowModel<UpdateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for update_name widget.
  FocusNode? updateNameFocusNode;
  TextEditingController? updateNameTextController;
  String? Function(BuildContext, String?)? updateNameTextControllerValidator;
  // State field(s) for update_crop widget.
  FocusNode? updateCropFocusNode;
  TextEditingController? updateCropTextController;
  String? Function(BuildContext, String?)? updateCropTextControllerValidator;
  // State field(s) for update_lang widget.
  FocusNode? updateLangFocusNode;
  TextEditingController? updateLangTextController;
  String? Function(BuildContext, String?)? updateLangTextControllerValidator;
  // State field(s) for update_phno widget.
  FocusNode? updatePhnoFocusNode;
  TextEditingController? updatePhnoTextController;
  String? Function(BuildContext, String?)? updatePhnoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    updateNameFocusNode?.dispose();
    updateNameTextController?.dispose();

    updateCropFocusNode?.dispose();
    updateCropTextController?.dispose();

    updateLangFocusNode?.dispose();
    updateLangTextController?.dispose();

    updatePhnoFocusNode?.dispose();
    updatePhnoTextController?.dispose();
  }
}
