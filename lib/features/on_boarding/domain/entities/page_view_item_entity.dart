class PageViewItemEntity {
  final String image;
  final String title;
  final String description;

  PageViewItemEntity({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<PageViewItemEntity> pgaeViewItemList = [
  PageViewItemEntity(
    image: 'assets/images/on_borading_1.png',
    title: 'Never miss an appointment !',
    description:
        'App will let you know about all upcoming appointments on time.',
  ),
  PageViewItemEntity(
    image: 'assets/images/on_boarding_2.png',
    title: 'Instantly schedule appointments',
    description: 'Quickly schedule appointments with easy user interface.',
  ),
  PageViewItemEntity(
    image: 'assets/images/on_boarding_3.png',
    title: 'Keep patient records with you !',
    description:
        'App has unique feature to create patient profile and keep all related documents.',
  ),
];
