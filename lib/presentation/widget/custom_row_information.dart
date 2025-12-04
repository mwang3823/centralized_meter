part of widget;

class CustomRowInformation extends StatelessWidget {
  final String title;
  final String? content;

  CustomRowInformation({super.key, required this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: AppTextSizes.subBody,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(width: AppSizes.minPadding,),
        Expanded(child: CustomText(
          text: content,
          textAlign: TextAlign.right,
        ))
      ],
    );
  }
}
