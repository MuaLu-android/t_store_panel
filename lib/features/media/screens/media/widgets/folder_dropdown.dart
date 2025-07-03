import 'package:admin_t_store/features/media/controllers/media_controllet.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, this.onChanged});
  final void Function(MediaCategory?)? onChanged;
  @override
  Widget build(BuildContext context) {
    //implement build
    final controller = MediaController.instance;
    return Obx(
      () => SizedBox(
        width: 140,

        child: DropdownButtonFormField(
          isExpanded: false,
          value: controller.selectedPath.value,
          items: MediaCategory.values
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.capitalize.toString()),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
