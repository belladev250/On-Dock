import 'package:flutter/material.dart';
import 'dart:ui';
import 'constants/colors.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _currentStep = 0;
  String? _selectedCategory;
  String? _selectedDriverType;
  String? _selectedTruckType;
  String? _selectedTruckBrand;
  bool _showAllSet = false;
  bool _showTruckTypeDropdown = false;
  bool _showTruckBrandDropdown = false;

  final List<String> _categories = [
    'Bus Driver',
    'Commercial Truck Driver',
    'Long Haul',
    'Camper / RVer',
    'Car Driver',
    'Motorcyclist',
    'Pedestrian',
  ];

  final List<String> _driverTypes = [
    'Regional Driver',
    'OTR Driver',
    'Local Driver',
    'Local Delivery Driver',
    'Owner Operator',
    'Others',
  ];

  final List<String> _truckTypes = [
    'Bobtail',
    'Dry Van Semi-trailer truck',
    'Reefer Semi-trailer truck',
    'Standard Flatbed truck',
    'Container Chassis truck',
    'Drop-Deck/Step-Deck Trailer truck',
    'Double Drop/Lowboy Trailer truck',
    'Conestoga Trailer truck',
    'Curtainside trailer truck',
    'Tanker truck',
    'Car hauler',
    'Livestock truck',
    'Logging truck',
    'Hot shot trailer truck',
    'Pickup truck',
    'Box truck',
    'Dump truck',
    'Garbage truck',
    'Tow truck',
    'Oversize truck',
    'Others',
  ];

  final List<String> _truckBrands = [
    'Freightliner',
    'Peterbilt',
    'Kenworth',
    'International',
    'Mack',
    'Western Star',
    'Dina',
    'Giant Motors',
    'Volkswagen',
    'Mercedes-Benz',
    'Renault',
    'TOYOTA',
    'Iveco',
    'Scania',
    'MAN',
    'DAF',
    'Unimog',
    'Astra',
    'Ginaf',
    'Dennis Eagle',
    'Alexander Dennis',
    'KamAZ',
    'Ural',
    'MAZ',
    'GAZ',
    'Toyota Hino',
    'Isuzu',
    'FAW Jiefang',
    'TATA motors',
    'Mitsubishi',
    'Suzuki',
    'Fuso',
    'Ashok Leyland',
    'Dongfeng',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  
                  // Top navigation bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      GestureDetector(
                        onTap: _currentStep > 0 
                            ? () {
                                setState(() {
                                  _currentStep--;
                                });
                              }
                            : null,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: _currentStep > 0 
                              ? AppColors.darkGrey 
                              : Colors.transparent,
                          size: 24,
                        ),
                      ),
                      
                      // Step indicator
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${_currentStep + 1}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.purple,
                                fontWeight: FontWeight.w600,
                                fontFamily: "PlusJakartaSans",
                              ),
                            ),
                            const TextSpan(
                              text: " of 3",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.mediumGrey,
                                fontWeight: FontWeight.normal,
                                fontFamily: "PlusJakartaSans",
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Spacer to balance the row
                      const SizedBox(width: 24),
                    ],
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Main content based on step
                  if (_currentStep == 0) _buildStep1(),
                  if (_currentStep == 1) _buildStep2(),
                  if (_currentStep == 2) _buildStep3(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          
          // All Set popup with glassmorphism
          if (_showAllSet)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAllSet = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Success icon
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.purple,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          const Text(
                            "All Set",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkPurple,
                              fontFamily: "PlusJakartaSans",
                            ),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          Text(
                            _selectedCategory == 'Commercial Truck Driver'
                                ? "You're registered as a ${_selectedDriverType ?? ''} operating a ${_selectedTruckType ?? 'truck'} under ${_selectedTruckBrand ?? 'your brand'}."
                                : "You're registered as a ${_selectedCategory ?? ''}.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.darkGrey,
                              fontFamily: "PlusJakartaSans",
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tell us—who are you on the road?",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.darkPurple,
            fontFamily: "PlusJakartaSans",
            height: 1.2,
          ),
        ),
        
        const SizedBox(height: 12),
        
        const Text(
          "Choose your main category.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.mediumGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Category options
        Column(
          children: _categories.map((category) {
            final isSelected = _selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = category;
                  });
                  
                  // Auto-advance logic
                  if (category == 'Commercial Truck Driver') {
                    // Go to step 2 after a short delay
                    Future.delayed(const Duration(milliseconds: 300), () {
                      setState(() {
                        _currentStep = 1;
                      });
                    });
                  } else {
                    // Show All Set popup for non-commercial drivers
                    Future.delayed(const Duration(milliseconds: 300), () {
                      setState(() {
                        _showAllSet = true;
                      });
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppColors.purple.withOpacity(0.1) 
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16, 
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected 
                                  ? AppColors.purple 
                                  : AppColors.mediumGrey,
                              width: 2,
                            ),
                            color: Colors.white,
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.purple,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.darkGrey,
                            fontFamily: "PlusJakartaSans",
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Which driver category fits you best?",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.darkPurple,
            fontFamily: "PlusJakartaSans",
            height: 1.2,
          ),
        ),
        
        const SizedBox(height: 12),
        
        const Text(
          "Pick one that apply to your work.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.mediumGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Driver type options
        Column(
          children: _driverTypes.map((type) {
            final isSelected = _selectedDriverType == type;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDriverType = type;
                  });
                  
                  // Auto-advance to step 3 after a short delay
                  Future.delayed(const Duration(milliseconds: 300), () {
                    setState(() {
                      _currentStep = 2;
                    });
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppColors.purple.withOpacity(0.1) 
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16, 
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected 
                                  ? AppColors.purple 
                                  : AppColors.mediumGrey,
                              width: 2,
                            ),
                            color: Colors.white,
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.purple,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          type,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.darkGrey,
                            fontFamily: "PlusJakartaSans",
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Which truck do you run on the road?",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.darkPurple,
            fontFamily: "PlusJakartaSans",
            height: 1.2,
          ),
        ),
        
        const SizedBox(height: 12),
        
        const Text(
          "Enter your truck's type and brand.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.mediumGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Truck Type dropdown
        const Text(
          "Truck Type",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 8),
        
        GestureDetector(
          onTap: () {
            setState(() {
              _showTruckTypeDropdown = !_showTruckTypeDropdown;
              _showTruckBrandDropdown = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _showTruckTypeDropdown 
                    ? AppColors.purple 
                    : AppColors.lightGrey,
                width: _showTruckTypeDropdown ? 2 : 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedTruckType ?? "Select truck type",
                  style: TextStyle(
                    color: _selectedTruckType != null
                        ? AppColors.darkGrey
                        : AppColors.mediumGrey,
                    fontFamily: "PlusJakartaSans",
                    fontSize: 15,
                  ),
                ),
                Icon(
                  _showTruckTypeDropdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: _showTruckTypeDropdown 
                      ? AppColors.purple 
                      : AppColors.mediumGrey,
                ),
              ],
            ),
          ),
        ),
        
        // Truck Type dropdown list
        if (_showTruckTypeDropdown) ...[
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.lightGrey,
                width: 1,
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _truckTypes.length,
              itemBuilder: (context, index) {
                final type = _truckTypes[index];
                final isSelected = _selectedTruckType == type;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTruckType = type;
                      _showTruckTypeDropdown = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.purple.withOpacity(0.1)
                          : Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color: index < _truckTypes.length - 1
                              ? AppColors.lightGrey.withOpacity(0.5)
                              : Colors.transparent,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            type,
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected
                                  ? AppColors.purple
                                  : AppColors.darkGrey,
                              fontFamily: "PlusJakartaSans",
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check,
                            color: AppColors.purple,
                            size: 18,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        
        const SizedBox(height: 24),
        
        // Truck Brand dropdown
        const Text(
          "Truck Brand",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 8),
        
        GestureDetector(
          onTap: () {
            setState(() {
              _showTruckBrandDropdown = !_showTruckBrandDropdown;
              _showTruckTypeDropdown = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _showTruckBrandDropdown 
                    ? AppColors.purple 
                    : AppColors.lightGrey,
                width: _showTruckBrandDropdown ? 2 : 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedTruckBrand ?? "Select truck brand",
                  style: TextStyle(
                    color: _selectedTruckBrand != null
                        ? AppColors.darkGrey
                        : AppColors.mediumGrey,
                    fontFamily: "PlusJakartaSans",
                    fontSize: 15,
                  ),
                ),
                Icon(
                  _showTruckBrandDropdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: _showTruckBrandDropdown 
                      ? AppColors.purple 
                      : AppColors.mediumGrey,
                ),
              ],
            ),
          ),
        ),
        
        // Truck Brand dropdown list
        if (_showTruckBrandDropdown) ...[
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.lightGrey,
                width: 1,
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _truckBrands.length,
              itemBuilder: (context, index) {
                final brand = _truckBrands[index];
                final isSelected = _selectedTruckBrand == brand;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTruckBrand = brand;
                      _showTruckBrandDropdown = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.purple.withOpacity(0.1)
                          : Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color: index < _truckBrands.length - 1
                              ? AppColors.lightGrey.withOpacity(0.5)
                              : Colors.transparent,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            brand,
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected
                                  ? AppColors.purple
                                  : AppColors.darkGrey,
                              fontFamily: "PlusJakartaSans",
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check,
                            color: AppColors.purple,
                            size: 18,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        
        const SizedBox(height: 32),
        
        // Finish button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _selectedTruckType != null && _selectedTruckBrand != null
                ? () {
                    setState(() {
                      _showAllSet = true;
                    });
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              foregroundColor: Colors.white,
              disabledBackgroundColor: AppColors.purple.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Finish",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "PlusJakartaSans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}