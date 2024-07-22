import 'package:flutter/cupertino.dart';
import '../../../../core/widgets/chip.dart';

class TopUpAmountSelection extends StatefulWidget {
  const TopUpAmountSelection({super.key, this.onAmountSelected});
  final Function(String)? onAmountSelected;
  @override
  State<TopUpAmountSelection> createState() => _TopUpAmountSelectionState();
}

class _TopUpAmountSelectionState extends State<TopUpAmountSelection> {
  String _selectedAmount = '';

  void _onChipTap(String amount) {
    setState(() {
      _selectedAmount = amount;
    });
    if(widget.onAmountSelected!=null) {
      widget.onAmountSelected!(amount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(
              label: '\$5.00',
              onTap: () => _onChipTap('\$5.00'),
              selected: _selectedAmount == '\$5.00',
            ),
            Chip(
              label: '\$10.00',
              onTap: () => _onChipTap('\$10.00'),
              selected: _selectedAmount == '\$10.00',
            ),
            Chip(
              label: '\$15.00',
              onTap: () => _onChipTap('\$15.00'),
              selected: _selectedAmount == '\$15.00',
            ),
            Chip(
              label: '\$20.00',
              onTap: () => _onChipTap('\$20.00'),
              selected: _selectedAmount == '\$20.00',
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(
              label: '\$30.00',
              onTap: () => _onChipTap('\$30.00'),
              selected: _selectedAmount == '\$30.00',
            ),
            Chip(
              label: '\$40.00',
              onTap: () => _onChipTap('\$40.00'),
              selected: _selectedAmount == '\$40.00',
            ),
            Chip(
              label: '\$50.00',
              onTap: () => _onChipTap('\$50.00'),
              selected: _selectedAmount == '\$50.00',
            ),
            Chip(
              label: '\$100.00',
              onTap: () => _onChipTap('\$100.00'),
              selected: _selectedAmount == '\$100.00',
            ),
          ],
        ),
      ],
    );
  }
}
