import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'view_photo_or_video_page_model.dart';
export 'view_photo_or_video_page_model.dart';

class ViewPhotoOrVideoPageWidget extends StatefulWidget {
  const ViewPhotoOrVideoPageWidget({
    super.key,
    required this.isPhoto,
    this.imageUrl,
  });

  final bool? isPhoto;
  final String? imageUrl;

  @override
  State<ViewPhotoOrVideoPageWidget> createState() =>
      _ViewPhotoOrVideoPageWidgetState();
}

class _ViewPhotoOrVideoPageWidgetState
    extends State<ViewPhotoOrVideoPageWidget> {
  late ViewPhotoOrVideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPhotoOrVideoPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.isPhoto ?? true)
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          widget.imageUrl!,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  if (!widget.isPhoto!)
                    Expanded(
                      child: FlutterFlowVideoPlayer(
                        path:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                        videoType: VideoType.network,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        autoPlay: false,
                        looping: false,
                        showControls: false,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 0.0, 10.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8.0,
                  buttonSize: 30.0,
                  fillColor: const Color(0x7FFFFFFF),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 12.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
