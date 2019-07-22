import 'dart:async';
import 'dart:io';

import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:android_intent/android_intent.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../AlmasaoodColors.dart';

class PickUpLocation extends StatefulWidget {
  @override
  State<PickUpLocation> createState() => PickUpLocationState();
}

class PickUpLocationState extends State<PickUpLocation> {
  GoogleMapController _controller;
//  GoogleMapController controller;
  final Set<Marker> _markers = {};



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.5074558, 36.2128544),
    zoom: 10,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(45.521563, -122.677433),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Geolocator _geolocator;
  Position currentLocation;

  @override
  void initState() {
    _geolocator = Geolocator();
    checkPermission();
    getPermissions();



//    updateLocation();
  }

  void checkPermission() {




    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status') ;
    });
    _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

  getPermissions() async {
    if (Platform.isAndroid) {
      openLocationSetting();

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//    Fluttertoast.showToast(msg: 'version: ${androidInfo.version.sdkInt}');
      if (androidInfo.version.sdkInt >= 23) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.location]);
        ServiceStatus serviceStatus = await PermissionHandler()
            .checkServiceStatus(PermissionGroup.location);

        //TODO ==> check the change in this line if it effects any thing  ?  ==>  convert from .index to .value
        print(
            "PERSMMISION: ${serviceStatus.value} __ ${permissions.values.toList()[0]}");
        await PermissionHandler()
            .shouldShowRequestPermissionRationale(PermissionGroup.location);
        if (permissions.values.toList()[0].toString() !=
            "PermissionStatus.denied") {
          getLocation();
        } else {
          Navigator.of(context).pop();
        }
      } else {
        getLocation();
      }
    } else {
      getLocation();
    }
  }

  void openLocationSetting() async {
    final PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    final AndroidIntent intent = new AndroidIntent(
      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
    );

    if (Platform.isAndroid) {
      if (permission.value == 1) intent.launch();
    }
  }

  void getLocation() {
    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((current) {
      setState(() {
        currentLocation = current;
        print("lat" + currentLocation.latitude.toString());

        print(
            "location ${currentLocation.longitude} , ${currentLocation.latitude}");
      });
    });
  }

  void updateLocation() async {
    try {
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      setState(() {
        currentLocation = newPosition;
        print("Curent location is : " + currentLocation.toString());
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            markers: _markers,
            mapType: MapType.terrain,
            onTap: (lang) {
              print (lang.longitude.toString() +"   "+lang.latitude.toString());

              setState(() {
                _markers.add(Marker(
                    onTap: () {},
                    visible: true,
                    position: LatLng(lang.latitude, lang.longitude),
                    markerId:
                        MarkerId((lang.longitude + lang.latitude).toString()),
                    icon: BitmapDescriptor.defaultMarker));
              });
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: onMapCreated
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 36.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MainButton(
                      text: "Use My Current Location",
                      onPressed: () {
                        setState(() {
                          _markers.clear();

                          print("curent current " +
                              currentLocation.longitude.toString());
                          _goToTheLake(currentLocation.longitude,
                              currentLocation.latitude);
//                          _markers.add(Marker(
//                              markerId: MarkerId(((currentLocation.longitude +
//                                      currentLocation.latitude)
//                                  .toString())),
//                              position: LatLng(currentLocation.latitude,
//                                  currentLocation.longitude)));
                        });
                      },
                      width: MediaQuery.of(context).size.width - 64,
                      color: AlmasaoodColors.primaryColor,
                      textColor: AlmasaoodColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake(
    double longitude,
    double latitude,
  ) async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 16)));
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller ;
    });
  }
}
