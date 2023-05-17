import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryView extends StatefulWidget {
  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  List<String> listImages = [
    "https://lh4.googleusercontent.com/0fyDyC-aMTjOzc4IUIwfjDoeZqf99Jh6hoDQBqybJxdIzHPgVuvX2dT6r5XhuyyOMvFpMGkv9FiONIEVbnOhGzB38rttm7JKF_gmIr4BEBR__jshaej7uMUHtRCEJ53hzw=w794",
    "https://lh4.googleusercontent.com/WuUc4RHVTz7W02Xh5brCCfXuXr28Ltv4QcTXyPbOvic_ViN-nJpFyfY1DrpF4fCE7XvSigrBctw7APeqZlZfLCs2a5TfQp7speUEYnPS_cPA9u4jBWGwkW3njXd661elNQ=w740",
    "https://lh4.googleusercontent.com/AMpuKdp5nAEt5iJbmVPFkonmH1p3kIPBUjnDvJ9pjLRe2pOriqEv1Uwzl7unDeuAFygRFSrK7zHQ3X3NDPm9ZnkmozihULlFOOHLwp8No4qGnTIqqGQiAFqyJuLUrPLHMQ=w794",
    "https://lh4.googleusercontent.com/0fyDyC-aMTjOzc4IUIwfjDoeZqf99Jh6hoDQBqybJxdIzHPgVuvX2dT6r5XhuyyOMvFpMGkv9FiONIEVbnOhGzB38rttm7JKF_gmIr4BEBR__jshaej7uMUHtRCEJ53hzw=w794",
  "https://images.unsplash.com/photo-1572537165377-627a37043464?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1572204292164-b35ba943fca7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGl4ZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1590254553792-7e91903c5357?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1548586196-aa5803b77379?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1572447454458-e68d82f828b3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODd8fHBpeGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1572204304559-b5f5380482c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA4fHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1554516829-a3fce6ddbc6e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQzfHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1563642421748-5047b6585a4a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTY2fHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1593439147804-c6c7656530ae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzUzfHxwaXhlbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Staggered GridView Sample")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StaggeredGridView.countBuilder(
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            itemCount: listImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: listImages[index],
                      fit: BoxFit.cover),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.4 : 1.9);
            }),
      ),
    );
  }
}