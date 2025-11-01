import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'organicfarming_widget.dart' show OrganicfarmingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrganicfarmingModel extends FlutterFlowModel<OrganicfarmingWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? selectedImage;

  String? detectedDisease;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataEte = false;
  FFUploadedFile uploadedLocalFile_uploadDataEte =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
