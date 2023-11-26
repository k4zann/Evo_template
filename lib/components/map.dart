// Container _map() {
//   return Container(
//     height: 400,
//     child: GoogleMap(
//       onMapCreated: _onMapCreated,
//       initialCameraPosition: CameraPosition(
//         target: sourceLocation,
//         zoom: 14.5,
//       ),
//       polylines: {
//         Polyline(
//           polylineId: PolylineId('route'),
//           points: polylineCoordination,
//           color: primaryColor,
//           width: 6,
//         ),
//       },
//       markers: {
//         Marker(
//           markerId: MarkerId('source'),
//           position: sourceLocation,
//         ),
//         Marker(
//           markerId: MarkerId('destination'),
//           position: destination,
//         ),
//       },
//     ),
//   );
// }


// void _getPolyPoints() async {
//   PolylinePoints polylinePoints = PolylinePoints();
//
//   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//     google_api_key,
//     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//     PointLatLng(destination.latitude, destination.longitude),
//   );
//
//   if (result.points.isNotEmpty) {
//     setState(() {
//       polylineCoordination = result.points
//           .map((PointLatLng point) => LatLng(point.latitude, point.longitude))
//           .toList();
//     });
//   }
// }

// void _onMapCreated(GoogleMapController controller) {
//   _mapController.complete(controller);
// }



// Completer<GoogleMapController> _mapController = Completer();
// static const LatLng sourceLocation = LatLng(37.335, -122.035);
// static const LatLng destination = LatLng(37.334, -122.957);
//
// List<LatLng> polylineCoordination = [];