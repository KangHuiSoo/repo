import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool choolCheckDone = false;
  GoogleMapController? mapController;

  // latitude - 위도, longitude - 경도
  static final LatLng companyLatLng = LatLng(
    35.1502,
    129.0095,
  );

  /* 내 위치 반경 100미터 원그리기  */
  static final double okDistance = 100;

  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId('withinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5),
    // 원의 색
    radius: okDistance,
    //반경 거리
    strokeColor: Colors.blue,
    // 원의둘레 색
    strokeWidth: 1, // 둘레의 두께
  );

  static final Circle notWithinDistanceCircle = Circle(
    circleId: CircleId('notWithinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.red.withOpacity(0.5),
    // 원의 색
    radius: okDistance,
    //반경 거리
    strokeColor: Colors.red,
    // 원의둘레 색
    strokeWidth: 1, // 둘레의 두께
  );

  static final Circle checkDoneCircle = Circle(
    circleId: CircleId('checkDoneCircle'),
    center: companyLatLng,
    fillColor: Colors.green.withOpacity(0.5),
    // 원의 색
    radius: okDistance,
    //반경 거리
    strokeColor: Colors.green,
    // 원의둘레 색
    strokeWidth: 1, // 둘레의 두께
  );

  /* */

  /* 마커 찍기 */
  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );

  /* */

  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == '위치 권한이 허용되었습니다.') {
            //StreamBuilder를 통해 현재위치가 변경이되면 다시 build한다.
            // 변경된 Position이 snapshot.data에 저장됨.
            return StreamBuilder<Position>(
                stream: Geolocator.getPositionStream(),
                builder: (context, snapshot) {
                  bool isWithinRange = false;

                  if (snapshot.hasData) {
                    final start = snapshot.data!;
                    final end = companyLatLng;

                    final distance = Geolocator.distanceBetween(
                      start.latitude,
                      start.longitude,
                      end.latitude,
                      end.longitude,
                    );

                    if (distance < okDistance) {
                      isWithinRange = true;
                    }
                  }

                  return Column(
                    children: [
                      _CustomGoogleMap(
                        initialPosition: initialPosition,
                        circle: choolCheckDone
                            ? checkDoneCircle
                            : isWithinRange
                                ? withinDistanceCircle
                                : notWithinDistanceCircle,
                        marker: marker,
                        onMapCreated: onMapCreated,
                      ),
                      _ChoolCheckButton(
                        onPressed: onChollCheckPressed,
                        choolCheckDone: choolCheckDone,
                        isWithinRange: isWithinRange,
                      ),
                    ],
                  );
                });
          }
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    //setState()할 필요없음 , 컨트롤러가 생겼을때는 화면을 다시 빌드하지는 않기때문
    mapController = controller;
  }

  onChollCheckPressed() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('출근하기'),
          content: Text('출근을 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('출근하기'),
            )
          ],
        );
      },
    );

    if (result) {
      setState(() {
        choolCheckDone = true;
      });
    }
  }

  Future<String> checkPermission() async {
    // 위치권한에 대한 서비스기능을 사용할 수 있는지 ?
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요';
    }

    //현재 앱이 가지고있는 위치서비스에 대한 권한이 어떻게 되는지 가져온다.
    LocationPermission checkedPermission = await Geolocator.checkPermission();

    // 위치권한 default 상태일때 (권한 허용이 안되었지만 요청은 할 수 있는 상태)
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요';
      }
    }

    // 권한요청시 사용자가 허용하지 않은 경우
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 기기 세팅에서 허가해주세요';
    }

    return '위치 권한이 허용되었습니다.';
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        '오늘도 출근',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          color: Colors.blue,
          onPressed: () async {
            if (mapController == null) {
              return;
            }

            final location = await Geolocator.getCurrentPosition();

            mapController!.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(
                  location.latitude,
                  location.longitude,
                ),
              ),
            );
          },
          icon: Icon(Icons.my_location),
        ),
      ],
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final Circle circle;
  final CameraPosition initialPosition;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  const _CustomGoogleMap({
    required this.initialPosition,
    required this.circle,
    required this.marker,
    required this.onMapCreated,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        circles: Set.from([circle]),
        markers: Set.from([marker]),
        onMapCreated: onMapCreated,
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {
  final bool isWithinRange;
  final VoidCallback onPressed;
  final bool choolCheckDone;

  const _ChoolCheckButton({
    required this.isWithinRange,
    required this.onPressed,
    required this.choolCheckDone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timelapse_outlined,
            size: 50,
            color: choolCheckDone
                ? Colors.green
                : isWithinRange
                    ? Colors.blue
                    : Colors.red,
          ),
          const SizedBox(height: 20.0),
          if (!choolCheckDone && isWithinRange)
            TextButton(
              onPressed: onPressed,
              child: Text("출근하기"),
            ),
        ],
      ),
    );
  }
}
