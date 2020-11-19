import 'package:flutter/cupertino.dart';

import '../app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: appState.isFetching
          ? Center(child: CircularProgressIndicator())
          : appState.getResponseJson() != null
              ? GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: List.generate(
                    appState.getResponseJson().length,
                    // appState.media.media.length,
                    (index) => appState.buildTile(
                      index, appState.getResponseJson()[index]['type'],
                      // index, appState.media.media[index].mediaType,
                    ),
                  ),
                )
              : Container(),
    );
  }
}
