import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'allchats_model.dart';
export 'allchats_model.dart';

class AllchatsWidget extends StatefulWidget {
  const AllchatsWidget({Key? key}) : super(key: key);

  @override
  _AllchatsWidgetState createState() => _AllchatsWidgetState();
}

class _AllchatsWidgetState extends State<AllchatsWidget> {
  late AllchatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllchatsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFCDCDCD),
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).error),
        automaticallyImplyLeading: false,
        title: Text(
          'Todos los mensajes',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Home');
              },
              child: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).error,
                size: 24.0,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            StreamBuilder<List<ChatsRecord>>(
              stream: queryChatsRecord(
                queryBuilder: (chatsRecord) => chatsRecord
                    .where('users', arrayContains: currentUserReference)
                    .orderBy('last_message_time', descending: true),
              ),
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
                List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewChatsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewChatsRecord =
                        listViewChatsRecordList[listViewIndex];
                    return StreamBuilder<FFChatInfo>(
                      stream: FFChatManager.instance
                          .getChatInfo(chatRecord: listViewChatsRecord),
                      builder: (context, snapshot) {
                        final chatInfo =
                            snapshot.data ?? FFChatInfo(listViewChatsRecord);
                        return FFChatPreview(
                          onTap: () => context.pushNamed(
                            'chats',
                            queryParameters: {
                              'chatUser': serializeParam(
                                chatInfo.otherUsers.length == 1
                                    ? chatInfo.otherUsersList.first
                                    : null,
                                ParamType.Document,
                              ),
                              'chatRef': serializeParam(
                                chatInfo.chatRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chatUser': chatInfo.otherUsers.length == 1
                                  ? chatInfo.otherUsersList.first
                                  : null,
                            },
                          ),
                          lastChatText: chatInfo.chatPreviewMessage(),
                          lastChatTime: listViewChatsRecord.lastMessageTime,
                          seen: listViewChatsRecord.lastMessageSeenBy!
                              .contains(currentUserReference),
                          title: chatInfo.chatPreviewTitle(),
                          userProfilePic: chatInfo.chatPreviewPic(),
                          color: Color(0xFFEEF0F5),
                          unreadColor: Colors.blue,
                          titleTextStyle: GoogleFonts.getFont(
                            'DM Sans',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          dateTextStyle: GoogleFonts.getFont(
                            'DM Sans',
                            color: Color(0x73000000),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                          previewTextStyle: GoogleFonts.getFont(
                            'DM Sans',
                            color: Color(0x73000000),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              3.0, 3.0, 3.0, 3.0),
                          borderRadius: BorderRadius.circular(0.0),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
