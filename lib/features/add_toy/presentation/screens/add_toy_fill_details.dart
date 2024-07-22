import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/categories.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/core/widgets/toy_image.dart';
import 'package:kidbank/features/add_toy/data/selected_age_riverpod.dart';
import 'package:kidbank/features/add_toy/data/selected_category_riverpod.dart';
import 'package:kidbank/features/add_toy/presentation/widgets/listing_list_item.dart';

import '../../../../core/colors.dart';
import '../../../../core/models/ages.dart';
import '../../../../core/widgets/main_back_button.dart';

class AddToyFillDetailsScreen extends StatelessWidget {
  const AddToyFillDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height, maxWidth: MediaQuery.of(context).size.width),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white100,
            navigationBar: const CupertinoNavigationBar(
              leading: MainBackButton(
                label: 'Back',
              ),
              middle: Text('Edit listing'),
            ),
            child: SingleChildScrollView(
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ToyImage(),
                          );
                        },
                      ),
                    ),
                    CustomTextField(
                      label: 'Title',
                      required: true,
                      helpText: '400 characters max',
                      validator: (value) {
                        if (value == null) {
                          return null;
                        } else if (value.length > 400) {
                          return 'Max lenght limit overflowed';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      label: 'Description',
                      required: true,
                      helpText: '1000 characters max',
                      validator: (value) {
                        if (value == null) {
                          return null;
                        } else if (value.length > 1000) {
                          return 'Max lenght limit overflowed';
                        }
                      },
                      maxLines: 5,
                    ),
                    CustomTextField.price(
                      label: 'Price',
                      required: true,
                      helpText: 'Enter the price at which you want to sell the item',
                    ),
                    CustomTextField.quantity(
                      label: 'Quantity',
                      required: true,
                      helpText: 'Enter the number of items you have',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListingListItem(
                      title: 'Category',
                      onTap: null, //TODO onTap,
                      trailingTitle: Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          Category? category = ref.watch(selectedCategoryProvider);
                          return Text(category != null ? category.name : 'None');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ListingListItem(
                      title: 'Age',
                      onTap: null, //TODO onTap,
                      trailingTitle: Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          Age? age = ref.watch(selectedAgeProvider);
                          return Text(age != null ? age.name : 'None');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ListingListItem(
                      title: 'Condition',
                      onTap: null, //TODO onTap,
                      trailingTitle: Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          //TODO riverpod for condition
                          return const Text('None');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    ListingListItem(
                      title: 'Color',
                      onTap: null, //TODO onTap,
                      trailingTitle: Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          //TODO riverpod for color
                          return const Text('None');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ListingListItem(
                      title: 'Material',
                      onTap: null, //TODO onTap,
                      trailingTitle: Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          //TODO riverpod for material
                          return const Text('None');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    const ListingListItem(
                      title: 'Specifications',
                      onTap: null, //TODO onTap,
                      trailingTitle: Text('Select')
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    const ListingListItem(
                        title: 'Location',
                        onTap: null, //TODO onTap,
                        trailingTitle: Text('None')
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    const ListingListItem(
                        title: 'Deactivate listing',
                        onTap: null, //TODO onTap,
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    const ListingListItem(
                        title: 'Delete listing',
                        onTap: null, //TODO onTap,
                        delete: true,
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    const MainButton(
                      text: 'Save changes',
                      onTap: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
