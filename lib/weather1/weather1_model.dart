import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'weather1_widget.dart' show Weather1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Weather1Model extends FlutterFlowModel<Weather1Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getcurrentlocation] action in weather1 widget.
  LatLng? locationresult;
  // Stores action output result for [Backend Call - API (green minds)] action in weather1 widget.
  ApiCallResponse? greenmindsresponse;
  // Stores action output result for [Backend Call - API (green minds)] action in Button widget.
  ApiCallResponse? apiResultahc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
