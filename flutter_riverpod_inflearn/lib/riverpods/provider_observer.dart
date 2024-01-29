import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {

  // 프로바이더가 업데이트 된 다음에..
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print("[Provider Updated] provider: $provider / pv: $previousValue / nv: $newValue");
  }

  // 프로바이더를 추가하면 불리는 상태 (현재의 값만 받을 수 있음)
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print("[Provider Added] provider: $provider / value: $value");
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    print("[Provider dispose] provider: $provider");
  }
}