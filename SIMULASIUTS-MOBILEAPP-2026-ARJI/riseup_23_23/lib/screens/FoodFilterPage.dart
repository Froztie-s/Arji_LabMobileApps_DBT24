import 'package:flutter/material.dart';

class FoodFilterPage extends StatefulWidget {
  const FoodFilterPage({super.key});

  @override
  State<FoodFilterPage> createState() => _FoodFilterPageState();
}

class _FoodFilterPageState extends State<FoodFilterPage> {
  // State variables to hold selected filters
  final Set<String> _selectedMeals = {};
  final Set<String> _selectedDiets = {
    'Vegan',
  }; // 'Vegan' is selected by default in your image
  final Set<String> _selectedMethods = {};
  final Set<String> _selectedIngredients = {};

  // Controllers for calorie inputs
  final TextEditingController _minCalController = TextEditingController();
  final TextEditingController _maxCalController = TextEditingController();

  // Defined colors based on your design
  final Color _accentColor = const Color(0xFF6C63FF);
  final Color _selectedChipColor = const Color(0xFFECEBFF);
  final Color _buttonColor = const Color(
    0xFF82C7F5,
  ); // A light blue for the button

  @override
  void dispose() {
    _minCalController.dispose();
    _maxCalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Filter",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Meals"),
              _buildChipGroup(
                ["Breakfast", "Lunch", "Dinner", "Snack", "Soup", "Salad"],
                [
                  Icons.breakfast_dining,
                  Icons.lunch_dining,
                  Icons.dinner_dining,
                  Icons.bakery_dining,
                  Icons.soup_kitchen,
                  Icons.restaurant_menu,
                ],
                _selectedMeals,
              ),
              const SizedBox(height: 24),

              _buildSectionTitle("Calories Range"),
              _buildCalorieRangeInputs(),
              const SizedBox(height: 24),

              _buildSectionTitle("Diet"),
              _buildChipGroup(["Vegan"], [Icons.eco], _selectedDiets),
              const SizedBox(height: 24),

              _buildSectionTitle("Method"),
              _buildChipGroup(
                ["Quick", "Few Ingredients", "Easy"],
                [Icons.timer, Icons.shopping_bag, Icons.check_circle],
                _selectedMethods,
              ),
              const SizedBox(height: 24),

              _buildSectionTitle("Ingredients"),
              _buildChipGroup(
                ["Yogurt", "Egg", "Milk", "Veggies", "Berries"],
                [
                  Icons.icecream,
                  Icons.egg,
                  Icons.local_drink,
                  Icons.local_florist,
                  Icons.grain,
                ],
                _selectedIngredients,
              ),
              const SizedBox(height: 40),

              // Done Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // For UX research, you can log the selected filters here
                    print("Applied Filters:");
                    print("Meals: $_selectedMeals");
                    print(
                      "Calories: ${_minCalController.text} - ${_maxCalController.text}",
                    );
                    print("Diets: $_selectedDiets");

                    // Navigate back to the list page
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper widget to build a group of filter chips
  Widget _buildChipGroup(
    List<String> labels,
    List<IconData> icons,
    Set<String> selectedSet,
  ) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: List.generate(labels.length, (index) {
        final label = labels[index];
        final icon = icons[index];
        final isSelected = selectedSet.contains(label);

        return FilterChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? _accentColor : Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? _accentColor : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                selectedSet.add(label);
              } else {
                selectedSet.remove(label);
              }
            });
          },
          backgroundColor: Colors.white,
          selectedColor: _selectedChipColor,
          checkmarkColor: _accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected ? _accentColor : Colors.grey.shade300,
            ),
          ),
          showCheckmark: false, // The image doesn't show checkmarks
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        );
      }),
    );
  }

  // Helper widget for the calorie range inputs
  Widget _buildCalorieRangeInputs() {
    return Row(
      children: [
        _buildCalorieTextField(_minCalController),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "-",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        _buildCalorieTextField(_maxCalController),
      ],
    );
  }

  // Helper widget for a single calorie text field
  Widget _buildCalorieTextField(TextEditingController controller) {
    return SizedBox(
      width: 80,
      height: 40,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _accentColor),
          ),
        ),
      ),
    );
  }
}
