abstract class MedicineStates{}
class SocialInitialState extends MedicineStates{}
class ShopChangeBottomNavState extends MedicineStates{}


class SocialGetUserLoadingState extends MedicineStates{}
class SocialGetUserSuccessState extends MedicineStates{}
class SocialGetUserErrorState extends MedicineStates{
  final String error;
  SocialGetUserErrorState(this.error);
}
class SocialGetAllUsersLoadingState extends MedicineStates{}
class SocialGetAllUsersSuccessState extends MedicineStates{}
class SocialGetAllUsersErrorState extends MedicineStates{
  final String error;
  SocialGetAllUsersErrorState(this.error);
}
class AppChangeDarkState extends MedicineStates{}
class SocialLoginLoadingState extends MedicineStates
{}
class SocialLoginSuccessState extends MedicineStates
{
  final String uid;

  SocialLoginSuccessState(this.uid);
}
class AppCreateDataBase extends MedicineStates
{}
class AppInsertDataBase extends MedicineStates
{}
class AppGetDataBase extends MedicineStates
{}
class AppChangeBottsssomState extends MedicineStates
{}
class Isclosedstate extends MedicineStates
{}
class AppGetDataBaseLoading extends MedicineStates
{}
class AppUpdateDataBase extends MedicineStates
{}
class AppDeleteDataBase extends MedicineStates
{}
class ChangeBottomNavBarState extends MedicineStates{}

class CreateDatabaseState extends MedicineStates{}

class InsertToDatabaseState extends MedicineStates{}

class GetDatabaseLoadingState extends MedicineStates{}
class GetDatabaseState extends MedicineStates{}

class UpdateDatabaseStatusState extends MedicineStates{}
class UpdateDatabaseTaskState extends MedicineStates{}
class DeleteDatabaseState extends MedicineStates{}

class ChangeBottomSheetState extends MedicineStates{}

class SocialLoginErrorState extends MedicineStates
{

  late final String error;
  SocialLoginErrorState(this.error);
}
class SocialchangePasswordState extends MedicineStates
{}
class LoadingRegisterState extends MedicineStates{}
class SuccessRegisterState extends MedicineStates{}
class ErrorRegisterState extends MedicineStates{
  late final String error;
  ErrorRegisterState(this.error);
}
class SocialUserUpdateLoadingState extends MedicineStates{}
class SocialProfileImagePickedSuccessState extends MedicineStates{}
class SocialProfileImagePickedErrorState extends MedicineStates{}
class SocialcoverimagePickedSuccessState extends MedicineStates{}
class SocialuploadimageErrorState extends MedicineStates{}
class SocialUserUpdateErrorState extends MedicineStates{}
class SocialuploadcoverimageErrorState extends MedicineStates{}
class SocialcoverimagePickedErrorState extends MedicineStates{}
class SuccessCreateUserState extends MedicineStates{}
class ErrorCreateUserState extends MedicineStates{
  late final String error;
  ErrorCreateUserState(this.error);
}
class SocialUserUpdateSuccessState extends MedicineStates{}

