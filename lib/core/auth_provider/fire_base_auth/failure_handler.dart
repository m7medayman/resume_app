import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

class InvalidEmailFailureHandle extends BaseFailureHandle {
  InvalidEmailFailureHandle()
      : super(
          code: 'invalid-email',
          failure: Failure(id: 1, message: 'The email address is not valid.'),
        );
}

BaseFailureHandle failure = BaseFailureHandle(
    code: 'test', failure: Failure(id: 1000, message: "test"));

class UserDisabledFailureHandle extends BaseFailureHandle {
  UserDisabledFailureHandle()
      : super(
          code: 'user-disabled',
          failure: Failure(
              id: 2,
              message:
                  'The user corresponding to the given email has been disabled.'),
        );
}

class UserNotFoundFailureHandle extends BaseFailureHandle {
  UserNotFoundFailureHandle()
      : super(
          code: 'user-not-found',
          failure:
              Failure(id: 3, message: 'No user found with the provided email.'),
        );
}

class WrongPasswordFailureHandle extends BaseFailureHandle {
  WrongPasswordFailureHandle()
      : super(
          code: 'wrong-password',
          failure:
              Failure(id: 4, message: 'Wrong password provided for that user.'),
        );
}

class TooManyRequestsFailureHandle extends BaseFailureHandle {
  TooManyRequestsFailureHandle()
      : super(
          code: 'too-many-requests',
          failure: Failure(
              id: 5, message: 'Too many requests. Please try again later.'),
        );
}

class OperationNotAllowedFailureHandle extends BaseFailureHandle {
  OperationNotAllowedFailureHandle()
      : super(
          code: 'operation-not-allowed',
          failure: Failure(
              id: 6,
              message:
                  'This operation is not allowed. Please contact support.'),
        );
}

class EmailAlreadyInUseFailureHandle extends BaseFailureHandle {
  EmailAlreadyInUseFailureHandle()
      : super(
          code: 'email-already-in-use',
          failure: Failure(
              id: 7,
              message:
                  'The email address is already in use by another account.'),
        );
}

class WeakPasswordFailureHandle extends BaseFailureHandle {
  WeakPasswordFailureHandle()
      : super(
          code: 'weak-password',
          failure:
              Failure(id: 8, message: 'The password provided is too weak.'),
        );
}

class NetworkRequestFailedFailureHandle extends BaseFailureHandle {
  NetworkRequestFailedFailureHandle()
      : super(
          code: 'network-request-failed',
          failure: Failure(
              id: 9,
              message: 'Network error. Please check your internet connection.'),
        );
}

class CredentialAlreadyInUseFailureHandle extends BaseFailureHandle {
  CredentialAlreadyInUseFailureHandle()
      : super(
          code: 'credential-already-in-use',
          failure: Failure(
              id: 10,
              message:
                  'The credential is already associated with a different user account.'),
        );
}

class InvalidCredentialFailureHandle extends BaseFailureHandle {
  InvalidCredentialFailureHandle()
      : super(
          code: 'invalid-credential',
          failure: Failure(
              id: 11,
              message: 'Wrong Email or Password'),
        );
}

class UserMismatchFailureHandle extends BaseFailureHandle {
  UserMismatchFailureHandle()
      : super(
          code: 'user-mismatch',
          failure: Failure(
              id: 12,
              message:
                  'The credential does not correspond to the logged-in user.'),
        );
}

class InvalidCredential extends BaseFailureHandle {
  InvalidCredential()
      : super(
            code: "invalid-credential",
            failure: Failure(id: 012, message: "invalid Email or password"));
}

class AccountExistsWithDifferentCredentialFailureHandle
    extends BaseFailureHandle {
  AccountExistsWithDifferentCredentialFailureHandle()
      : super(
          code: 'account-exists-with-different-credential',
          failure: Failure(
              id: 13,
              message:
                  'An account already exists with the email associated with this credential.'),
        );
}

class InternalErrorFailureHandle extends BaseFailureHandle {
  InternalErrorFailureHandle()
      : super(
          code: 'internal-error',
          failure: Failure(
              id: 14,
              message: 'An internal error has occurred. Please try again.'),
        );
}

class PermissionDeniedFailureHandle extends BaseFailureHandle {
  PermissionDeniedFailureHandle()
      : super(
          code: 'permission-denied',
          failure: Failure(
              id: 15,
              message: 'You do not have permission to access this resource.'),
        );
}

class NotFoundFailureHandle extends BaseFailureHandle {
  NotFoundFailureHandle()
      : super(
          code: 'not-found',
          failure:
              Failure(id: 16, message: 'The requested document was not found.'),
        );
}

class AlreadyExistsFailureHandle extends BaseFailureHandle {
  AlreadyExistsFailureHandle()
      : super(
          code: 'already-exists',
          failure: Failure(id: 17, message: 'The document already exists.'),
        );
}

class CancelledFailureHandle extends BaseFailureHandle {
  CancelledFailureHandle()
      : super(
          code: 'cancelled',
          failure: Failure(id: 18, message: 'The operation was cancelled.'),
        );
}

class DeadlineExceededFailureHandle extends BaseFailureHandle {
  DeadlineExceededFailureHandle()
      : super(
          code: 'deadline-exceeded',
          failure: Failure(
              id: 19, message: 'The operation took too long to complete.'),
        );
}

class ResourceExhaustedFailureHandle extends BaseFailureHandle {
  ResourceExhaustedFailureHandle()
      : super(
          code: 'resource-exhausted',
          failure: Failure(
              id: 20,
              message:
                  'The operation could not be completed due to resource exhaustion.'),
        );
}

class FailedPreconditionFailureHandle extends BaseFailureHandle {
  FailedPreconditionFailureHandle()
      : super(
          code: 'failed-precondition',
          failure: Failure(
              id: 21,
              message:
                  'The operation was rejected due to a failed precondition.'),
        );
}

class AbortedFailureHandle extends BaseFailureHandle {
  AbortedFailureHandle()
      : super(
          code: 'aborted',
          failure: Failure(id: 22, message: 'The operation was aborted.'),
        );
}

class OutOfRangeFailureHandle extends BaseFailureHandle {
  OutOfRangeFailureHandle()
      : super(
          code: 'out-of-range',
          failure: Failure(
              id: 23,
              message: 'The operation was attempted past the valid range.'),
        );
}

class UnimplementedFailureHandle extends BaseFailureHandle {
  UnimplementedFailureHandle()
      : super(
          code: 'unimplemented',
          failure: Failure(
              id: 24,
              message: 'The operation is not implemented or supported.'),
        );
}

class UnavailableFailureHandle extends BaseFailureHandle {
  UnavailableFailureHandle()
      : super(
          code: 'unavailable',
          failure:
              Failure(id: 25, message: 'The service is currently unavailable.'),
        );
}

class DataLossFailureHandle extends BaseFailureHandle {
  DataLossFailureHandle()
      : super(
          code: 'data-loss',
          failure: Failure(
              id: 26, message: 'Unrecoverable data loss or corruption.'),
        );
}

class UnauthenticatedFailureHandle extends BaseFailureHandle {
  UnauthenticatedFailureHandle()
      : super(
          code: 'unauthenticated',
          failure: Failure(
              id: 27,
              message: 'You must be authenticated to perform this operation.'),
        );
}

class NullAuth extends BaseFailureHandle {
  NullAuth()
      : super(
          code: 'Null Auth User',
          failure: Failure(id: 28, message: 'Null Auth User'),
        );
}

class NullAuthData extends BaseFailureHandle {
  NullAuthData()
      : super(
          code: 'Null user data',
          failure: Failure(id: 29, message: 'Null Auth User Data'),
        );
}

class NullAuthDataDoc extends BaseFailureHandle {
  NullAuthDataDoc()
      : super(
          code: 'Null Auth User  Doc',
          failure: Failure(id: 29, message: 'Null Auth User Doc'),
        );
}

void initAllAuthFailureHandles() {
  // Initializing all the failure handle classes
  InvalidEmailFailureHandle();
  UserDisabledFailureHandle();
  UserNotFoundFailureHandle();
  WrongPasswordFailureHandle();
  TooManyRequestsFailureHandle();
  OperationNotAllowedFailureHandle();
  EmailAlreadyInUseFailureHandle();
  WeakPasswordFailureHandle();
  NetworkRequestFailedFailureHandle();
  CredentialAlreadyInUseFailureHandle();
  InvalidCredentialFailureHandle();
  UserMismatchFailureHandle();
  AccountExistsWithDifferentCredentialFailureHandle();
  InternalErrorFailureHandle();
  PermissionDeniedFailureHandle();
  NotFoundFailureHandle();
  AlreadyExistsFailureHandle();
  CancelledFailureHandle();
  DeadlineExceededFailureHandle();
  ResourceExhaustedFailureHandle();
  FailedPreconditionFailureHandle();
  AbortedFailureHandle();
  OutOfRangeFailureHandle();
  UnimplementedFailureHandle();
  UnavailableFailureHandle();
  DataLossFailureHandle();
  UnauthenticatedFailureHandle();
  NullAuth();
  NullAuthData();
  NullAuthDataDoc();
}
