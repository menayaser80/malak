import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}
List<BoardingModel>boarding=[
  // BoardingModel(
  //   image:'assets/images/13.png',
  //   title: '121'.tr,
  //   body: '122'.tr,
  // ),
  // BoardingModel(
  //   image:'assets/images/14.png',
  //   title: '123'.tr,
  //   body: '124'.tr,
  // ),
  // BoardingModel(
  //   image:'assets/images/11.jpg',
  //   title: '125'.tr,
  //   body: '126'.tr,
  // ),
  // BoardingModel(
  //   image:'assets/images/12.png',
  //   title: '127'.tr,
  //   body: '128'.tr,
  // ),
  BoardingModel(
    image:'assets/images/community.jpg',
    title: 'Welcome to Epi-care Application.',
    body: 'showing The Application Systems',
  ),
  BoardingModel(
    image:'assets/images/4.jpg',
    title: 'Nutrition and Sport Systems.',
    body: 'Epi-care application has an integrated system of diabetes care as it provides an integrated diet and exercise regime fit for the patient',
  ),
  BoardingModel(
    image:'assets/images/5.jpg',
    title: 'Emergency Alerts.',
    body: 'Epi-care includes a glucose monitoring alert system, notifying patients of critical levels and offering instructions for immediate management',
  ),
  BoardingModel(
    image:'assets/images/6.jpg',
    title: 'Doctors and Patients Community.',
    body: 'The application features a community integrating doctors and patients, facilitating direct interaction for medical assistance when needed',
  ),
  BoardingModel(
    image:'assets/images/7.jpg',
    title: 'Maps Guide.',
    body: 'The application offers the additional benefit of identifying and locating the nearest hospital or clinic based on the user\s current geographical location',
  ),
];