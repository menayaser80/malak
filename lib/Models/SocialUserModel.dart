class SocialUserModel
{
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? image;
  String? bio;
  String? cover;
  String? usertype;

  bool? isEmailVerified;

  SocialUserModel({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.bio,
    this.cover,
    this.usertype,
    this.uid,
    this.isEmailVerified,
  });
  SocialUserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
    image=json['image'];
    bio=json['bio'];
    cover=json['cover'];
    usertype=json['usertype'];
    isEmailVerified=json['isEmailVerified'];
  }
  Map<String,dynamic>toMap()
  {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
      'image':image,
      'cover':cover,
      'bio':bio,
      'usertype':usertype,
      'isEmailVerified':isEmailVerified,
    };
  }
}