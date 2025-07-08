import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/models/brand_model.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iconsax/iconsax.dart';

class ProductBrandsScreen extends StatelessWidget {
  const ProductBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand label
          Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          // TypeAheadFiela for brand selection
          TypeAheadField(
            builder: (context, ctr, focusNode) {
              return TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Brand',
                  suffixIcon: Icon(Iconsax.box),
                ),
              );
            },
            suggestionsCallback: (pattern) {
              // Return filtered brand suggestion base on the search pattern
              return [
                BrandModel(id: 'id', image: TImages.adidasLogo, name: 'Adidas'),
                BrandModel(id: 'id', image: TImages.adidasLogo, name: 'Nike'),
              ];
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion.name));
            },
            onSelected: (suggestion) {},
          ),
        ],
      ),
    );
  }
}
