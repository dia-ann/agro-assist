import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
    this.temp,
  });

  final String? temp;

  static String routeName = 'dashboard';
  static String routePath = '/dashboard';

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.greenmindsresponse = await GreenMindsCall.call(
        lat: FFAppState().currentlat,
        lon: FFAppState().currentlng,
        apikey: 'cc85a1a8b767e08c49ebc5cc6b54bb7f',
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFD3F3A6),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/download_(3).jpeg',
                        width: 434.5,
                        height: 1001.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF06413A),
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(LoginWidget.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 100.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  Weather1Widget.routeName,
                                  queryParameters: {
                                    'temp': serializeParam(
                                      GreenMindsCall.currenttemp(
                                        (_model.greenmindsresponse?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.double,
                                    ),
                                    'main': serializeParam(
                                      GreenMindsCall.currentweathermain(
                                        (_model.greenmindsresponse?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.String,
                                    ),
                                    'desc': serializeParam(
                                      GreenMindsCall.currentweatherdescription(
                                        (_model.greenmindsresponse?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.String,
                                    ),
                                    'icon': serializeParam(
                                      GreenMindsCall.currentweathericon(
                                        (_model.greenmindsresponse?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 314.9,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Color(0xFF06413A),
                                    width: 5.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            "MMMEd",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF0A1717),
                                                fontSize: 16.0,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          GreenMindsCall.currenttemp(
                                            (_model.greenmindsresponse
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toString(),
                                          '26',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF0A1717),
                                              fontSize: 40.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              'https://openweathermap.org/img/wn/${GreenMindsCall.currentweathericon(
                                                (_model.greenmindsresponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )}@2x.png',
                                              'https://openweathermap.org/img/wn/10d@2x.png',
                                            ),
                                            width: 70.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                GreenMindsCall
                                                    .currentweathermain(
                                                  (_model.greenmindsresponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'main',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF0A1717),
                                                    fontSize: 19.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            GreenMindsCall
                                                .currentweatherdescription(
                                              (_model.greenmindsresponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            'description',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF0A1717),
                                                fontSize: 19.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 30.0))
                                          .addToStart(SizedBox(width: 50.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(OrganicfarmingWidget.routeName);
                              },
                              child: Container(
                                width: 300.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Color(0xFF06413A),
                                    width: 5.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      60.0, 35.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'b3n8188d' /* Disease Detection */,
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
                                          fontSize: 40.0,
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
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(ChatbotWidget.routeName);
                            },
                            child: Container(
                              width: 300.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xFF06413A),
                                  width: 5.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 150.0,
                                  height: 150.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/chatbot1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.97, -0.98),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(ProfileWidget.routeName);
                  },
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/ideaslogo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}