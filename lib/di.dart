import 'package:simple_di/simple_di.dart';

T getService<T>({dynamic args, bool throwIfNotFound = true}) {
  return ServiceProvider().getService<T>(
    args: args,
    throwIfNotFound: throwIfNotFound,
  );
}
