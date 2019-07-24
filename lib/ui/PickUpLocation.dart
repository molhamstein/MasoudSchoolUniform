import 'dart:async';
import 'dart:io';

import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/OrderModel.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:android_intent/android_intent.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

import '../AlmasaoodColors.dart';
import '../UserFeedBack.dart';
import 'LastStep.dart';

class PickUpLocation extends StatefulWidget {
  @override
  State<PickUpLocation> createState() => PickUpLocationState();
}

class PickUpLocationState extends State<PickUpLocation> with UserFeedback {
  GoogleMapController _controller;

//  GoogleMapController controller;
  Set<Marker> _markers = {};
  bool isLocationSelected;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.581179, 54.046655),
    zoom: 7,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(45.521563, -122.677433),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Geolocator _geolocator;
  Position currentLocation;

  double selectedLng;

  double selectedLat;

  addM() {
    for (int i = 0; i < bloc.centers.length; i++) {
      _markers.add(Marker(
          onTap: () {
            setState(() {
              print(bloc.centers[i].lng);
              print(bloc.centers[i].lat);

              selectedLat = bloc.centers[i].lat;
              selectedLng = bloc.centers[i].lng;
              isLocationSelected = true;
              print("tapped");
            });
          },
          draggable: true,
          markerId: MarkerId(bloc.centers[i].lat.toString()),
          infoWindow: InfoWindow(
            title: "${bloc.centers[i].name(AppLocalizations.of(context).locale)}",
//            snippet: "${"name"}",
          ),
          position: LatLng(bloc.centers[i].lat, bloc.centers[i].lng)));
    }
  }

  @override
  void initState() {
    _geolocator = Geolocator();
    checkPermission();
    getPermissions();

    isLocationSelected = false;

//    Timer(Duration(seconds: 5), () => _showFeedback());

    if (!bloc.withDelivery) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Toast.show(
            AppLocalizations.of(context).trans('please_select_the_center_you_want_to_pick_items_from'), context,
            duration: 6,
            gravity: Toast.BOTTOM,
            backgroundColor: AlmasaoodColors.red);
      });
    }

    print("bloc . with delivery " + bloc.withDelivery.toString());

    print(_markers.length);

    print("with delivary" + bloc.withDelivery.toString());

//    updateLocation();
  }

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
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
    if (bloc.withDelivery == false) {
      if (bloc.centers.isNotEmpty) {
        addM();
      }
    }

    return Scaffold(
      body: StreamBuilder<OrderModel>(
          stream: bloc.orderStream,
          builder: (context, orderSnapshot) {
            if (orderSnapshot.hasData && orderSnapshot.data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (context) => LastStep()));
              });

//          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LastStep()));

            } else if (orderSnapshot.hasError && bloc.showFeedback) {
              {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showInSnackBar(  AppLocalizations.of(context).trans('something_went_wrong'), context,
                      color: AlmasaoodColors.red);
                  bloc.showFeedback = false;
                });
              }
            }

            return Stack(
              children: <Widget>[
                GoogleMap(
                    myLocationEnabled: true,
                    markers: _markers,
                    mapType: MapType.terrain,
                    onTap: (lang) {
                      print(lang.longitude.toString() +
                          "   " +
                          lang.latitude.toString());

                      if (bloc.withDelivery) {
                        setState(() {
                          _markers.clear();

                          selectedLng = lang.longitude;
                          selectedLat = lang.latitude;
                          isLocationSelected = true;
                          _markers.add(Marker(
                              onTap: () {},
                              visible: true,
                              position: LatLng(lang.latitude, lang.longitude),
                              markerId: MarkerId(
                                  (lang.longitude + lang.latitude).toString()),
                              icon: BitmapDescriptor.defaultMarker));
                        });
                      }
                    },
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: onMapCreated),
                Visibility(
                  replacement: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      StreamBuilder<List<ProductDetailsModel>>(
                          stream: bloc.cartStream,
                          builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 36.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Opacity(
                                    opacity: isLocationSelected ? 1 : 0.5,
                                    child: MainButton(
                                      shouldRotate: bloc.showFeedback,
                                      text: AppLocalizations.of(context).trans('use_selected_location'),
                                      onPressed: () {
                                        if (!isLocationSelected) {
                                        } else {
                                          bloc.createOrder("", selectedLng,
                                              selectedLat, snapshot.data);
                                        }
                                      },
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      color: isLocationSelected
                                          ? AlmasaoodColors.primaryColor
                                          : AlmasaoodColors.notSelected,
                                      textColor: AlmasaoodColors.white,
                                      dashColor: AlmasaoodColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                  visible: bloc.withDelivery,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                height: 60,
                                width: 60,
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      _markers.clear();
                                      print("curent current " +
                                          currentLocation.longitude.toString() +
                                          "     " +
                                          currentLocation.latitude.toString());
                                      isLocationSelected = true;
                                      selectedLng = currentLocation.longitude;
                                      selectedLat = currentLocation.latitude;
                                      _markers.add(Marker(
                                          onTap: () {},
                                          visible: true,
                                          position: LatLng(
                                              currentLocation.latitude,
                                              currentLocation.longitude),
                                          markerId: MarkerId(
                                              (currentLocation.longitude +
                                                      currentLocation.latitude)
                                                  .toString()),
                                          icon:
                                              BitmapDescriptor.defaultMarker));
                                      _goToMyLocation(currentLocation.longitude,
                                          currentLocation.latitude);
                                    });
                                  },
                                  child: Icon(Icons.my_location),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      StreamBuilder<List<ProductDetailsModel>>(
                          stream: bloc.cartStream,
                          builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 36.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Opacity(
                                    opacity: isLocationSelected ? 1 : 0.5,
                                    child: MainButton(
                                      shouldRotate: bloc.showFeedback,
                                      text: AppLocalizations.of(context).trans('use_selected_location'),
                                      onPressed: () {
                                        if (!isLocationSelected) {
                                        } else {
                                          bloc.createOrder("", selectedLat,
                                              selectedLng, snapshot.data);
                                        }
                                      },
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      color: isLocationSelected
                                          ? AlmasaoodColors.primaryColor
                                          : AlmasaoodColors.notSelected,
                                      textColor: AlmasaoodColors.white,
                                      dashColor: AlmasaoodColors.white,
                                    ),
                                  ),
                                  StreamBuilder<bool>(
                                      stream: bloc.shouldRotateStream,
                                      builder: (context, rotateSnapshot) {
                                        if (!rotateSnapshot.data) {
                                          return InkWell(
                                            onTap: () {
                                              bloc.createOrder(
                                                  "", "", "", snapshot.data);
                                            },
                                            child: SizedBox(
                                              width: 80,
                                              height: 50,
                                              child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(context).trans('skip'),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.white,
                                                      offset: Offset(0.0, 0.0),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ),
                                          );
                                        } else {
                                          return CircularProgressIndicator(
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                          Color>(
                                                      AlmasaoodColors
                                                          .primaryColor));
                                        }
                                        ;
                                      })
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Future<void> _goToMyLocation(
    double longitude,
    double latitude,
  ) async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 15)));
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }
}
