abstract class Failure {}

class NetworkFailure extends Failure {}

class GlobalFailure extends Failure {
  final String exception;
  GlobalFailure({required this.exception});

  Map<String, dynamic> toJson() => {
        "exception": exception.toString(),
      };
}
