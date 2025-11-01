import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // Stores action output result for [Custom Action - simulateBotResponse] action in send widget.
  List<String>? updatedChatList;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    queryFocusNode?.dispose();
    queryTextController?.dispose();
  }
}
