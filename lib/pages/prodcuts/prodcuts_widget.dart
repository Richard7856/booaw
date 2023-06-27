import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'prodcuts_model.dart';
export 'prodcuts_model.dart';

class ProdcutsWidget extends StatefulWidget {
  const ProdcutsWidget({
    Key? key,
    this.produts,
  }) : super(key: key);

  final DocumentReference? produts;

  @override
  _ProdcutsWidgetState createState() => _ProdcutsWidgetState();
}

class _ProdcutsWidgetState extends State<ProdcutsWidget>
    with TickerProviderStateMixin {
  late ProdcutsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdcutsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        limit: 1,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UsersRecord> prodcutsUsersRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<ProdutsRecord>(
                  stream: ProdutsRecord.getDocument(widget.produts!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitFadingCircle(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    final columnProdutsRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              columnProdutsRecord.image,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: columnProdutsRecord.image,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: columnProdutsRecord.image,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          columnProdutsRecord.image,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0x3A000000),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 46.0,
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pop();
                                                },
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0x3A000000),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 46.0,
                                                fillColor: columnProdutsRecord
                                                            .favorite ==
                                                        true
                                                    ? Color(0xFFF40062)
                                                    : Color(0x00000000),
                                                icon: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  columnProdutsRecord.name.maybeHandleOverflow(
                                    maxChars: 20,
                                    replacement: '…',
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF1D2429),
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  formatNumber(
                                    columnProdutsRecord.price,
                                    formatType: FormatType.custom,
                                    format: '\$ ',
                                    locale: '',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF4B39EF),
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  columnProdutsRecord.vendedor,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFA130),
                                  ),
                                  direction: Axis.horizontal,
                                  rating: 5.0,
                                  unratedColor: Color(0xFF95A1AC),
                                  itemCount: 5,
                                  itemSize: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Fecha de creacion: ${dateTimeFormat('yMMMd', columnProdutsRecord.createdAt)}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Personas viendo este producto: ${random_data.randomInteger(20, 500).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF1D2429),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 16.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'DESCRIPCIÓN',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF1D2429),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    columnProdutsRecord.description,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              StreamBuilder<ProdutsRecord>(
                stream: ProdutsRecord.getDocument(widget.produts!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitFadingCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  final bottomButtonAreaProdutsRecord = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF00FBFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x55000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Visibility(
                      visible: bottomButtonAreaProdutsRecord.name !=
                          currentUserDisplayName,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 52.0),
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                  'uid',
                                  isEqualTo:
                                      bottomButtonAreaProdutsRecord.vendor),
                              limit: 1,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> rowUsersRecordList = snapshot
                                  .data!
                                  .where((u) => u.uid != currentUserUid)
                                  .toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    rowUsersRecordList.length, (rowIndex) {
                                  final rowUsersRecord =
                                      rowUsersRecordList[rowIndex];
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 7.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'chats',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                rowUsersRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatUser': rowUsersRecord,
                                            },
                                          );
                                        },
                                        text: 'Contactar al vendedor',
                                        icon: Icon(
                                          Icons.email_rounded,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 3.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFCDCDCD),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
