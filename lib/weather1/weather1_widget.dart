import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'weather1_model.dart';
export 'weather1_model.dart';

/// "Build a weather page layout in FlutterFlow.
///
/// At the top, place a card that shows the current weather with:
///
/// City name
///
/// Current temperature (large text)
///
/// Weather icon (sunny, cloudy, rainy etc.)
///
/// Short description (e.g., 'Partly Cloudy')
///
/// Below the current weather card, create a scrollable section that displays
/// the 8-day forecast in a grid or horizontal list. Each day’s forecast
/// should include:
///
/// Day of the week
///
/// Weather icon
///
/// Min and Max temperature
///
/// Use a clean, modern design with soft colors and rounded cards. The top
/// section should feel prominent, while the forecast section should be
/// compact but clear."
class Weather1Widget extends StatefulWidget {
  const Weather1Widget({
    super.key,
    required this.temp,
    required this.main,
    required this.desc,
    required this.icon,
  });

  final double? temp;
  final String? main;
  final String? desc;
  final String? icon;

  static String routeName = 'weather1';
  static String routePath = '/weather1';

  @override
  State<Weather1Widget> createState() => _Weather1WidgetState();
}

class _Weather1WidgetState extends State<Weather1Widget> {
  late Weather1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Weather1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.locationresult = await actions.getcurrentlocation();
      FFAppState().currentlocation = _model.locationresult;
      FFAppState().currentlat = functions.getlatitude(_model.locationresult);
      FFAppState().currentlng = functions.getlongitude(_model.locationresult);
      safeSetState(() {});
      _model.greenmindsresponse = await GreenMindsCall.call(
        lat: FFAppState().currentlat,
        lon: FFAppState().currentlng,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFD3F3A6),
        appBar: AppBar(
          backgroundColor: Color(0xFFD3F3A6),
          iconTheme: IconThemeData(color: Color(0xFF06413A)),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              '3tapleak' /* Weather */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF094F49),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: Color(0xFF2C3E50),
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/download_(3).jpeg',
                    width: screenWidth,
                    height: screenHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: GreenMindsCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final columnGreenMindsResponse = snapshot.data!;

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20.0,
                                          color: Color(0x334A90E2),
                                          offset: Offset(
                                            0.0,
                                            8.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFD3F3A6),
                                          Color(0xFFD3F3A6)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(1.0, 1.0),
                                        end: AlignmentDirectional(-1.0, -1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0xFF06413A),
                                        width: 5.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            "MMMEd",
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF06413A),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToStart(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    '${widget!.temp?.toString()}°C',
                                                    '26',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF006644),
                                                        // Scale main temperature font by screen width
                                                        fontSize:
                                                            screenWidth * 0.15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      'https://openweathermap.org/img/wn/${GreenMindsCall.currentweathericon(
                                                        columnGreenMindsResponse
                                                            .jsonBody,
                                                      )}@2x.png',
                                                      'https://openweathermap.org/img/wn/10d@2x.png',
                                                    ),
                                                    width: screenWidth * 0.18,
                                                    height: screenWidth * 0.18,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                screenWidth *
                                                                    0.15,
                                                                0.0,
                                                                screenWidth *
                                                                    0.10,
                                                                0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget!.main,
                                                        'main',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF06413A),
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                120.0,
                                                                0.0,
                                                                39.0,
                                                                10.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget!.desc,
                                                        'description',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF006644),
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(height: 6.0))
                                                  .addToStart(
                                                      SizedBox(height: 4.0))
                                                  .addToEnd(
                                                      SizedBox(height: 4.0)),
                                            ),
                                          ]
                                              .addToStart(SizedBox(height: 3.0))
                                              .addToEnd(SizedBox(height: 5.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'r26o2kzr' /* 8-Day Forecast */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF094F49),
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Container(
                                              width: 310.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 8.0,
                                                    color: Color(0x1A000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: Color(0xFF06413A),
                                                  width: 5.0,
                                                ),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final dailyweatherlist =
                                                      GreenMindsCall
                                                              .dailyweather(
                                                            columnGreenMindsResponse
                                                                .jsonBody,
                                                          )?.toList() ??
                                                          [];

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            dailyweatherlist
                                                                .length,
                                                            (dailyweatherlistIndex) {
                                                      final dailyweatherlistItem =
                                                          dailyweatherlist[
                                                              dailyweatherlistIndex];
                                                      return Container(
                                                        width: 290.0,
                                                        height: 55.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFD3F3A6),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${dateTimeFormat(
                                                                "EEEE",
                                                                functions
                                                                    .convertunixtodatetime(
                                                                        getJsonField(
                                                                  dailyweatherlistItem,
                                                                  r'''$.dt''',
                                                                ).toString()),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}-${getJsonField(
                                                                dailyweatherlistItem,
                                                                r'''$.weather[0].main''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF05302B),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  'https://openweathermap.org/img/wn/${getJsonField(
                                                                    dailyweatherlistItem,
                                                                    r'''$.weather[0].icon''',
                                                                  ).toString()}@2x.png',
                                                                  'https://openweathermap.org/img/wn/10d@2x.png',
                                                                ),
                                                                width: 40.0,
                                                                height: 163.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '${valueOrDefault<String>(
                                                                  getJsonField(
                                                                    dailyweatherlistItem,
                                                                    r'''$.temp.min''',
                                                                  )?.toString(),
                                                                  '22',
                                                                )}/${valueOrDefault<String>(
                                                                  getJsonField(
                                                                    dailyweatherlistItem,
                                                                    r'''$.temp.max''',
                                                                  )?.toString(),
                                                                  '29',
                                                                )}',
                                                                'min/max',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF05302B),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 5.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          10.0)),
                                                        ),
                                                      );
                                                    })
                                                        .divide(SizedBox(
                                                            height: 15.0))
                                                        .addToStart(SizedBox(
                                                            height: 23.0))
                                                        .addToEnd(SizedBox(
                                                            height: 23.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResultahc =
                                          await GreenMindsCall.call(
                                        lat: 28.67,
                                        lon: 73.82,
                                        apikey:
                                            'cc85a1a8b767e08c49ebc5cc6b54bb7f',
                                      );

                                      if ((_model.apiResultahc?.succeeded ??
                                          true)) {
                                        context.pushNamed(
                                          CropsuggestionsWidget.routeName,
                                          queryParameters: {
                                            'lat': serializeParam(
                                              28.67,
                                              ParamType.double,
                                            ),
                                            'lon': serializeParam(
                                              77.22,
                                              ParamType.double,
                                            ),
                                            'temp': serializeParam(
                                              valueOrDefault<double>(
                                                GreenMindsCall.currenttemp(
                                                  columnGreenMindsResponse
                                                      .jsonBody,
                                                ),
                                                32.0,
                                              ),
                                              ParamType.double,
                                            ),
                                            'humidity': serializeParam(
                                              valueOrDefault<double>(
                                                GreenMindsCall.currenthumidity(
                                                  columnGreenMindsResponse
                                                      .jsonBody,
                                                )?.toDouble(),
                                                54.0,
                                              ),
                                              ParamType.double,
                                            ),
                                            'rainfall': serializeParam(
                                              80.0,
                                              ParamType.double,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'xca2sk7v' /* Get Suggestions */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF06413A),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 24.0))
                                  .addToStart(SizedBox(height: 28.0))
                                  .addToEnd(SizedBox(height: 24.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
