import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // latitude - 위도, longitude - 경도
  static final LatLng companyLatLng = LatLng(
    35.1502,
    129.0095,
  );

  static final double distance = 100;

  static final Circle circle = Circle(
    circleId: CircleId('circle'),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5), // 원의 색
    radius: distance, //반경 거리
    strokeColor: Colors.blue, // 원의둘레 색
    strokeWidth: 1,// 둘레의 두께
  );

  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == '위치 권한이 허용되었습니다.') {
            return Column(
              children: [
                _CustomGoogleMap(
                  initialPosition: initialPosition,
                  circle: circle,
                ),
                _ChoolCheckButton(),
              ],
            );
          }
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
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
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final Circle circle;
  final CameraPosition initialPosition;

  const _CustomGoogleMap({
    required this.initialPosition,
    required this.circle,
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
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {
  const _ChoolCheckButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text('출근'),
    );
  }
}
