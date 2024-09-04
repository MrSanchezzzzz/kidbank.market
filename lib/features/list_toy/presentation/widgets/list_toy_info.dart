import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/list_toy/data/toy_listing_riverpod.dart';
import 'package:kidbank/features/list_toy/data/toy_listing_validator.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ListToyInfo extends ConsumerStatefulWidget {
  const ListToyInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListToyInfoState();
}

class _ListToyInfoState extends ConsumerState<ListToyInfo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() => _handleTextInput(selectedTitleProvider, ToyListingValidator.validateTitle, _titleController));
    _descriptionController.addListener(() => _handleTextInput(selectedDescriptionProvider, ToyListingValidator.validateDescription, _descriptionController));
    _priceController.addListener(() => _handleNumberInput(selectedPriceProvider, _priceController));
    _quantityController.addListener(_handleQuantityInput);

  }

  void _handleTextInput(StateNotifierProvider<ToyListingNotifier<String?>, String?> provider,
      String? Function(String?) validator, TextEditingController controller) {
    if (validator(controller.text) == null) {
      ref.read(provider.notifier).setValue(controller.text);
    }
  }

  void _handleNumberInput(StateNotifierProvider<ToyListingNotifier<int?>, int?> provider, TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      final value = int.parse(controller.text);
      if (value >= 1) ref.read(provider.notifier).setValue(value);
    }
  }

  void _handleQuantityInput() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (_quantityController.text.isEmpty) {
        _quantityController.text = '1';
      }
      _quantityController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityController.text.length));
      _handleNumberInput(selectedQuantityProvider, _quantityController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Title',
          required: true,
          helpText: '400 characters max',
          validator: ToyListingValidator.validateTitle,
          controller: _titleController,
        ),
        CustomTextField(
          label: 'Description',
          required: true,
          helpText: '1000 characters max',
          validator: ToyListingValidator.validateDescription,
          maxLines: 5,
          controller: _descriptionController,
        ),
        CustomTextField.price(
          label: 'Price',
          required: true,
          helpText: 'Enter the price at which you want to sell the item',
          controller: _priceController,
        ),
        CustomTextField.quantity(
          label: 'Quantity',
          required: true,
          helpText: 'Enter the number of items you have',
          controller: _quantityController,
        ),
      ],
    );
  }
}
