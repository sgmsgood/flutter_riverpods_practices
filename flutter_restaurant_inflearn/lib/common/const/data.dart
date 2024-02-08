import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

// const localIp = '192.168.10.18:3000'; // 회사 ip
const localIp = '192.168.31.21:3000'; // 집 ip
// const localIp = '192.168.219.110:3000'; // tap.into ip

final storage = FlutterSecureStorage();