import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organicfarming_model.dart';
export 'organicfarming_model.dart';
// Core Flutter and Dart imports
import 'dart:typed_data';
import 'package:flutter/services.dart';
// TFLite and image processing packages
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class OrganicfarmingWidget extends StatefulWidget {
  const OrganicfarmingWidget({super.key});

  static String routeName = 'organicfarming';
  static String routePath = '/organicfarming';

  @override
  State<OrganicfarmingWidget> createState() => _OrganicfarmingWidgetState();
}

class _OrganicfarmingWidgetState extends State<OrganicfarmingWidget> {
  late OrganicfarmingModel _model;

  // TFLite interpreters for the two models
  Interpreter? _interpreter1;
  Interpreter? _interpreter2;

  // List to hold the labels from the labels.txt file
  List<String>? _labels;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganicfarmingModel());

    // Load the TFLite models and labels when the page is initialized.
    _loadModels();
  }

  /// Helper function to load both TFLite models and labels from assets.
  Future<void> _loadModels() async {
    try {
      // Load labels from the asset file
      final labelsData = await rootBundle.loadString('assets/models/labels.txt');
      _labels = labelsData.split('\n').map((label) => label.trim()).where((label) => label.isNotEmpty).toList();

      // Load the first model
      _interpreter1 = await Interpreter.fromAsset('assets/models/model1.tflite');

      // Load the second model
      _interpreter2 = await Interpreter.fromAsset('assets/models/model2.tflite');

      debugPrint("Models and labels loaded successfully.");
    } catch (e) {
      debugPrint("Error loading models: $e");
      // Handle error, maybe show a message to the user
      if (mounted) {
        setState(() {
          _model.detectedDisease = "Error loading models.";
        });
      }
    }
  }

  @override
  void dispose() {
    _model.dispose();
    // Dispose of the interpreters to free up resources
    _interpreter1?.close();
    _interpreter2?.close();

    super.dispose();
  }

  /// Preprocesses the image and runs inference using both models.
  Future<String> _runInferenceOnImage(Uint8List imageBytes) async {
    if (_interpreter1 == null || _interpreter2 == null || _labels == null) {
      return "Models not loaded.";
    }

    // Decode and preprocess the image
    img.Image? originalImage = img.decodeImage(imageBytes);
    if (originalImage == null) return "Failed to decode image.";

    // Assuming models expect a 224x224 input
    img.Image resizedImage = img.copyResize(originalImage, width: 224, height: 224);
    var input = Float32List(1 * 224 * 224 * 3);
    var buffer = input.buffer.asUint8List();
    int pixelIndex = 0;
    for (var y = 0; y < 224; y++) {
      for (var x = 0; x < 224; x++) {
        var pixel = resizedImage.getPixel(x, y);
        // Normalize pixel values to [0, 1]
        buffer[pixelIndex++] = (pixel.r.toInt() * (255.0 / 255.0)).toInt();
        buffer[pixelIndex++] = (pixel.g.toInt() * (255.0 / 255.0)).toInt();
        buffer[pixelIndex++] = (pixel.b.toInt() * (255.0 / 255.0)).toInt();
      }
    }
    final reshapedInput = input.reshape([1, 224, 224, 3]);

    // Prepare output tensors
    var output1 = List.filled(1 * _labels!.length, 0.0).reshape([1, _labels!.length]);
    var output2 = List.filled(1 * _labels!.length, 0.0).reshape([1, _labels!.length]);

    // Run inference
    _interpreter1!.run(reshapedInput, output1);
    _interpreter2!.run(reshapedInput, output2);

    // Process results
    double maxConfidence1 = (output1[0] as List<double>).reduce(max);
    int index1 = (output1[0] as List<double>).indexOf(maxConfidence1);

    double maxConfidence2 = (output2[0] as List<double>).reduce(max);
    int index2 = (output2[0] as List<double>).indexOf(maxConfidence2);

    // Compare predictions and return the best one
    if (index1 == index2) {
      return _labels![index1]; // Both models agree
    } else {
      // Models disagree, pick the one with higher confidence
      if (maxConfidence1 > maxConfidence2) {
        return "${_labels![index1]} (Model 1)";
      } else {
        return "${_labels![index2]} (Model 2)";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF06413A),
          automaticallyImplyLeading: true,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '9jmp5iwl' /* Disease Detection */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: 487.8,
                height: 897.74,
                decoration: BoxDecoration(
                  color: Color(0xFFD3F3A6),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/signup.jpg',
                          width: 527.7,
                          height: 1661.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 80.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.memory(
                                _model.selectedImage?.bytes ??
                                    Uint8List.fromList([]),
                                width: 250.0,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '91028ce6' /* Detected disease: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF06413A),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                if (_model.detectedDisease != null &&
                                        _model.detectedDisease != ''
                                    ? true
                                    : false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.detectedDisease,
                                        '\"  \"',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF06413A),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 10.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadDataEte = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading_uploadDataEte =
                                        false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadDataEte =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                _model.selectedImage =
                                    _model.uploadedLocalFile_uploadDataEte;
                                setState(() {
                                  _model.detectedDisease = 'Processing...';
                                });

                                // Run inference asynchronously
                                final prediction = await _runInferenceOnImage(
                                    _model.selectedImage!.bytes!);
                                setState(() {
                                  _model.detectedDisease = prediction;
                                });
                              },
                              text: FFLocalizations.of(context).getText(
                                '887373au' /* Analyse Image */,
                              ),
                              options: FFButtonOptions(
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF06413A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 5.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
