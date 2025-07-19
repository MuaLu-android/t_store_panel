import 'package:admin_hmoob_store/features/shop/controllers/products/product_attribute_controller.dart';
import 'package:admin_hmoob_store/features/shop/models/product_variation_model.dart';
import 'package:admin_hmoob_store/utils/popups/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVariationController extends GetxController {
  static ProductVariationController get instance => Get.find();
  // Obsevable for loading
  final isLoading = false.obs;
  final RxList<ProductVariationModel> productVariations =
      <ProductVariationModel>[].obs;
  // List to store
  List<Map<ProductVariationModel, TextEditingController>> stockControllerList =
      [];
  List<Map<ProductVariationModel, TextEditingController>> priceControllerList =
      [];
  List<Map<ProductVariationModel, TextEditingController>>
  salePriceControllerList = [];
  List<Map<ProductVariationModel, TextEditingController>>
  descriprionControllerList = [];

  // instance AttributeController
  final attributeController = Get.put(ProductAttributeController());
  void initializeVariationController(List<ProductVariationModel> variations) {
    /// Clear existing list
    stockControllerList.clear();
    priceControllerList.clear();
    salePriceControllerList.clear();
    descriprionControllerList.clear();
    // Initialize controllers for each variation
    for (var variation in variations) {
      // Stock Controllers
      Map<ProductVariationModel, TextEditingController> stockControllers = {};
      stockControllers[variation] = TextEditingController(
        text: variation.stock.toString(),
      );
      stockControllerList.add(stockControllers);

      // Price Controllers
      Map<ProductVariationModel, TextEditingController> priceControllers = {};
      priceControllers[variation] = TextEditingController(
        text: variation.price.toString(),
      );
      priceControllerList.add(priceControllers);

      // Sale Price Controllers
      Map<ProductVariationModel, TextEditingController> salePriceControllers =
          {};
      salePriceControllers[variation] = TextEditingController(
        text: variation.salePrice.toString(),
      );
      salePriceControllerList.add(salePriceControllers);

      // Description Controllers
      Map<ProductVariationModel, TextEditingController> descriptionControllers =
          {};
      descriptionControllers[variation] = TextEditingController(
        text: variation.description,
      );
      descriprionControllerList.add(descriptionControllers);
    }
  }

  // Function remove variations
  void removeVariations(BuildContext context) {
    TDialogs.defaultDialog(
      context: context,
      title: 'Remove Variations',
      onConfirm: () {
        productVariations.value = [];
        resetAllValues();
        Navigator.of(context).pop();
      },
    );
  }

  // Function to generate
  void generateVariationsConfirmation(BuildContext context) {
    TDialogs.defaultDialog(
      context: context,
      confirmText: 'Generate',
      title: 'Generate Variations',
      content:
          'Once the variations are created, you cannot add more attributes. '
          'In order to add more variations, you have to delete any of the attributes.',
      onConfirm: () {
        generateVariationsFromAttributes();
      },
    );
  }

  // Function to generate variations from attributes
  void generateVariationsFromAttributes() {
    // Close the previous Popup
    Get.back();

    final List<ProductVariationModel> variations = [];

    // Check if there are attributes
    if (attributeController.productAttributes.isNotEmpty) {
      // Get all combinations of attribute values, e.g., [Green, Blue], [Small, Large]
      final List<List<String>> attributeCombinations = getCombinations(
        attributeController.productAttributes
            .map((attr) => attr.value ?? <String>[])
            .toList(),
      );

      // Generate ProductVariationModel for each combination
      for (final combination in attributeCombinations) {
        final Map<String, String> attributeValues = Map.fromIterables(
          attributeController.productAttributes.map((attr) => attr.name ?? ''),
          combination,
        );

        // You can set default values for other properties if needed
        final ProductVariationModel variation = ProductVariationModel(
          id: UniqueKey().toString(),
          attributeValue: attributeValues,
        );

        variations.add(variation);

        // Create controllers
        final Map<ProductVariationModel, TextEditingController>
        stockControllers = {};
        final Map<ProductVariationModel, TextEditingController>
        priceControllers = {};
        final Map<ProductVariationModel, TextEditingController>
        salePriceControllers = {};
        final Map<ProductVariationModel, TextEditingController>
        descriptionControllers = {};

        // Assuming variation is your current ProductVariationModel
        stockControllers[variation] = TextEditingController();
        priceControllers[variation] = TextEditingController();
        salePriceControllers[variation] = TextEditingController();
        descriptionControllers[variation] = TextEditingController();

        // Add the maps to their respective lists
        stockControllerList.add(stockControllers);
        priceControllerList.add(priceControllers);
        salePriceControllerList.add(salePriceControllers);
        descriprionControllerList.add(descriptionControllers);
      }
    }
    productVariations.assignAll(variations);
  }

  void resetAllValues() {
    priceControllerList.clear();
    stockControllerList.clear();
    priceControllerList.clear();
    salePriceControllerList.clear();
    descriprionControllerList.clear();
  }

  List<List<String>> getCombinations(List<List<String>> list) {
    final List<List<String>> result = [];
    // Start combing
    combine(list, 0, <String>[], result);

    return result;
  }

  void combine(
    List<List<String>> lists,
    int index,
    List<String> current,
    List<List<String>> result,
  ) {
    // If we have reached the end of the lists, add the current combination to the result
    if (index == lists.length) {
      result.add(List.from(current));
      return;
    }

    // Iterate over the values of the current attribute
    for (final item in lists[index]) {
      // Create an updated list with the current value added
      final List<String> updated = List.from(current)..add(item);

      // Recursively combine with the next attribute
      combine(lists, index + 1, updated, result);
    }
  }
}
