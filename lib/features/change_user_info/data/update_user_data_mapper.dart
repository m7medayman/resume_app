import 'package:resume_app/core/auth_provider/responses/requests/request.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

extension UpdateUserDataMapper on UpdateUserParameters {
  UserInfoDataRequest toUserInfoRequest() {
    return UserInfoDataRequest(
        name: name,
        phone: phone,
        address: address,
        contactEmail: contactEmail,
        contactDetails: contactExtraDetails.toJson(),
        educationInfo: educationInfo.toJson());
  }
}
