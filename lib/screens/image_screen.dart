import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:wallie/utils/display_snackbar.dart';

class ImageScreen extends StatelessWidget {
  final _key = GlobalKey<ExpandableFabState>();
  ImageScreen({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'image$index',
          child: CachedNetworkImage(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return const Material(
                child: Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        overlayStyle: ExpandableFabOverlayStyle(blur: 3),
        childrenOffset: Offset.fromDirection(30),
        children: [
          FloatingActionButton(
            onPressed: () async {
              FileDownloader.downloadFile(
                name: 'wallie_wallpaper.jpeg',
                url: imageUrl,
                onDownloadCompleted: (String path) {
                  DisplaySnackbar(
                    context: context,
                    message: 'File downloaded',
                    color: Colors.green,
                  );
                },
                onDownloadError: (String error) {
                  DisplaySnackbar(
                    context: context,
                    message: 'Failed to download',
                    color: Colors.red,
                  );
                },
              );

              _closeFABMenu();
            },
            tooltip: 'Download',
            child: const Icon(CupertinoIcons.cloud_download),
          ),
          FloatingActionButton(
            onPressed: () {
              _closeFABMenu();
            },
            tooltip: 'Set on lock screen',
            child: const Icon(CupertinoIcons.lock_fill),
          ),
          FloatingActionButton(
            onPressed: () {
              _closeFABMenu();
            },
            tooltip: 'Set on home screen',
            child: const Icon(CupertinoIcons.home),
          ),
        ],
      ),
    );
  }

  void _closeFABMenu() {
    final state = _key.currentState;
    if (state != null) {
      state.toggle();
    }
  }
}
