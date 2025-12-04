import 'package:flutter/material.dart';
import 'package:dbtt/presentation/widget/widget.dart';
import 'dart:convert';
import '../../../../../../../../../../common/assets.dart';
import '../bloc/image_customer_bloc.dart';

class ImageCustomerScreen extends StatefulWidget {
  final ImageCustomerBloc bloc;

  const ImageCustomerScreen({super.key, required this.bloc});

  @override
  State<ImageCustomerScreen> createState() => _ImageCustomerScreenState();
}

class _ImageCustomerScreenState extends State<ImageCustomerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc.onGetCustomerImage();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.streamImage,
      builder: (context, snapshot) {
        final image = snapshot.data;
        return ContainerDataBuilder(
          data: image,
          bodyBuilder: () {
            return CustomListView(
              children:
                  image?.map((e) {
                    final base64Str = e.base64Image?.split(",").last ?? "";
                    Image imageWidget;
                    if (base64Str.isNotEmpty) {
                      try {
                        final bytes = base64Decode(base64Str);
                        imageWidget = Image.memory(
                          bytes,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Image.asset(
                                Assets.resolve(Assets.imageLogo),
                                fit: BoxFit.cover,
                              ),
                        );
                      } catch (_) {
                        imageWidget = Image.asset(
                          Assets.resolve(Assets.imageLogo),
                          fit: BoxFit.cover,
                        );
                      }
                    } else {
                      imageWidget = Image.asset(
                        Assets.resolve(Assets.imageLogo),
                        fit: BoxFit.cover,
                      );
                    }
                    return InkWell(
                      onTap: () {
                        widget.bloc.showImageDialog(
                          context,
                          base64Str,
                        );
                      },
                      child: imageWidget,
                    );
                  }).toList(),
            );
          },
        );
      },
    );
  }
}
