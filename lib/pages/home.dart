import 'dart:async';

import 'package:evo_template1/pages/profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:evo_template1/pages/drawer.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../models/app_location.dart';
import '../models/mapController.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mapControllerCompleter = Completer<YandexMapController>();

  Future<void> _moveToCurrentLocation(
      AppLatLong appLatLong,
      ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = AstanaLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }


  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }
  @override
  void initState() {
    super.initState();
    _initPermission();
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: buildSheet(),
      key: _scaffoldKey,
      endDrawer: NavBar(),
      body: Stack(
        children: [
          // _map(),
          _map1(mapControllerCompleter, context),
          buildSheet()
        ],
      ),
      bottomNavigationBar: _bottomAppBar(_scaffoldKey, context),
    );
  }


}


  Container _map1(Completer<YandexMapController> mapControllerCompleter, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.28,
      child: YandexMap(
        onMapCreated: (controller) {
          mapControllerCompleter.complete(controller);
        },
      ),
    );
  }

  Widget buildSheet() => DraggableScrollableSheet(
    initialChildSize: 0.7,
    minChildSize: 0.13,
    maxChildSize: 0.8,
    builder:(_, controller) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        controller: controller,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _container('Эвакуация', 'assets/icons/towing.png'),
              SizedBox(width: 30,),
              _container('Замена Колес', 'assets/icons/wheel.png'),
              SizedBox(width: 30,),
              _container('Взлом двери', 'assets/icons/key.png')
            ],
          ),
          SizedBox(height: 15,),
          Column(
            children: [
              _divider(),
              SizedBox(height: 20,),
              Text(
                'Заполните все данные',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff0D1230)
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    hintText: 'Varcovia',
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    suffixIcon: Container(
                      width: 200,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {

                                },
                                icon: Icon(Icons.close),
                              ),
                            VerticalDivider(
                              color: Colors.black,
                              indent: 10,
                              endIndent: 10,
                              thickness: 0.1,
                            ),
                            TextButton(
                              onPressed: () {

                              },
                              child: Text(
                                'Card'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    hintText: 'Марка машины',
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black, // Adjust border color as needed
                        width: 1.0, // Adjust border width as needed
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    hintText: 'Опишите проблему подробнее',
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xff0D1230),
                      fontWeight: FontWeight.w400
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black, // Adjust border color as needed
                        width: 1.0, // Adjust border width as needed
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused))
                          return Colors.red;
                        return null; // Defer to the widget's default.
                      }
                  ),
                ),
                onPressed: () { },
                child: Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ]
          ),
        ],
      ),
    ),
  );

  Container _divider() {
    return Container(
      width: 400,
      height: 0,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffA8A8A8)),
      ),
    );
  }


  BottomAppBar _bottomAppBar(GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset('assets/icons/home.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/icons/person.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage())
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/icons/time.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/icons/hamburg.png'),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }


  InkWell _container(String name, String iconPath) {
    return InkWell(
      onTap: () {

      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.07),
              offset: const Offset(0, 10),
              spreadRadius: 0,
              blurRadius: 40,
            ),
          ],
        ),
        child: Container(
          width: 80,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  iconPath,
                  height: 40,
                  width: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
