import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(6.5916, 3.2911), zoom: 16.0),
              zoomGesturesEnabled: true,
            ),
          )
        ],
      ),
    );
  }
}

// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   Completer<GoogleMapController> controller1;

//   //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
//   static LatLng _initialPosition;
//   final Set<Marker> _markers = {};
//   static LatLng _lastMapPosition = _initialPosition;

//   @override
//   void initState() {
//     super.initState();
//     _getUserLocation();
//   }

//   void _getUserLocation() async {
//     Position position = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemark = await Geolocator()
//         .placemarkFromCoordinates(position.latitude, position.longitude);
//     setState(() {
//       _initialPosition = LatLng(position.latitude, position.longitude);
//       print('${placemark[0].name}');
//     });
//   }

//   _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       controller1.complete(controller);
//     });
//   }

//   MapType _currentMapType = MapType.normal;

//   void _onMapTypeButtonPressed() {
//     setState(() {
//       _currentMapType = _currentMapType == MapType.normal
//           ? MapType.satellite
//           : MapType.normal;
//     });
//   }

//   _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }

//   _onAddMarkerButtonPressed() {
//     setState(() {
//       _markers.add(Marker(
//           markerId: MarkerId(_lastMapPosition.toString()),
//           position: _lastMapPosition,
//           infoWindow: InfoWindow(
//               title: "Pizza Parlour",
//               snippet: "This is a snippet",
//               onTap: () {}),
//           onTap: () {},
//           icon: BitmapDescriptor.defaultMarker));
//     });
//   }

//   Widget mapButton(Function function, Icon icon, Color color) {
//     return RawMaterialButton(
//       onPressed: function,
//       child: icon,
//       shape: new CircleBorder(),
//       elevation: 2.0,
//       fillColor: color,
//       padding: const EdgeInsets.all(7.0),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _initialPosition == null
//           ? Container(
//               child: Center(
//                 child: Text(
//                   'loading map..',
//                   style: TextStyle(
//                       fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
//                 ),
//               ),
//             )
//           : Container(
//               child: Stack(children: <Widget>[
//                 GoogleMap(
//                   markers: _markers,
//                   mapType: _currentMapType,
//                   initialCameraPosition: CameraPosition(
//                     target: _initialPosition,
//                     zoom: 14.4746,
//                   ),
//                   onMapCreated: _onMapCreated,
//                   zoomGesturesEnabled: true,
//                   onCameraMove: _onCameraMove,
//                   myLocationEnabled: true,
//                   compassEnabled: true,
//                   myLocationButtonEnabled: false,
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                       margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
//                       child: Column(
//                         children: <Widget>[
//                           mapButton(_onAddMarkerButtonPressed,
//                               Icon(Icons.add_location), Colors.blue),
//                           mapButton(
//                               _onMapTypeButtonPressed,
//                               Icon(
//                                 IconData(0xf473,
//                                     fontFamily: CupertinoIcons.iconFont,
//                                     fontPackage:
//                                         CupertinoIcons.iconFontPackage),
//                               ),
//                               Colors.green),
//                         ],
//                       )),
//                 )
//               ]),
//             ),
//     );
//   }
// }
