import 'package:flutter/material.dart';
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
  String _truckType = '';
  String _truckBrand = '';
  bool _isAllSet = false;

 

  final List<String> _categories = [
    'Bus Driver',
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
    'Owner Operator',
    'Others',
  ];

  void _handleNext() {
    if (_currentStep == 0 && _selectedCategory == null) {
      return;
    }
    if (_currentStep == 1 && _selectedDriverType == null) {
      return;
    }
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _handlePrevious() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              
            
              if (!_isAllSet)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${_currentStep + 1} of 3",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.mediumGrey,
                        fontFamily: "PlusJakartaSans",
                      ),
                    ),
                  ],
                ),
              
              const SizedBox(height: 30),
              
              // Main content based on step
              if (!_isAllSet) ...[
               
                if (_currentStep == 0) _buildStep1(),
                
                
                if (_currentStep == 1) _buildStep2(),
                
               
                if (_currentStep == 2) _buildStep3(),
                
                const SizedBox(height: 40),
                
                // Navigation buttons
                Row(
                  children: [
                    if (_currentStep > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _handlePrevious,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                            side: BorderSide(color: AppColors.purple),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.purple,
                              fontFamily: "PlusJakartaSans",
                            ),
                          ),
                        ),
                      ),
                    if (_currentStep > 0) const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _handleNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _currentStep == 2 ? "Complete" : "Next",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "PlusJakartaSans",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // All Set screen
                _buildAllSetScreen(),
              ],
              
              const SizedBox(height: 40),
            ],
          ),
        ),
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
          ),
        ),
        
        const SizedBox(height: 8),
        
        const Text(
          "Choose your main category.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Category options
        Column(
          children: _categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selectedCategory == category 
                      ? AppColors.purple 
                      : AppColors.lightGrey,
                    width: _selectedCategory == category ? 2 : 1,
                  ),
                ),
                child: RadioListTile<String>(
                  title: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGrey,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                  value: category,
                  // ignore: deprecated_member_use
                  groupValue: _selectedCategory,
                  // ignore: deprecated_member_use
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  activeColor: AppColors.purple,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
          ),
        ),
        
        const SizedBox(height: 8),
        
        const Text(
          "Pick one that apply to your work.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Driver type options
        Column(
          children: _driverTypes.map((type) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                 
                ),
                child: RadioListTile<String>(
                  title: Text(
                    type,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGrey,
                      fontFamily: "PlusJakartaSans",
                    ),
                  ),
                  value: type,
                  // ignore: deprecated_member_use
                  groupValue: _selectedDriverType,
                  // ignore: deprecated_member_use
                  onChanged: (value) {
                    setState(() {
                      _selectedDriverType = value;
                    });
                  },
                  activeColor: AppColors.purple,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
          ),
        ),
        
        const SizedBox(height: 8),
        
        const Text(
          "Enter your truck's type and brand.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Truck Type
        const Text(
          "Truck Type",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 8),
        
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.lightGrey),
          ),
          child: TextField(
            onChanged: (value) => setState(() => _truckType = value),
            decoration: const InputDecoration(
              hintText: "e.g., Bobtail, Reefer, Tanker, Oversize",
              hintStyle: TextStyle(
                color: AppColors.mediumGrey,
                fontFamily: "PlusJakartaSans",
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontFamily: "PlusJakartaSans",
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Truck Brand
        const Text(
          "Truck Brand",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 8),
        
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.lightGrey),
          ),
          child: TextField(
            onChanged: (value) => setState(() => _truckBrand = value),
            decoration: const InputDecoration(
              hintText: "e.g., Mack, Peterbilt, Scania, Isuzu",
              hintStyle: TextStyle(
                color: AppColors.mediumGrey,
                fontFamily: "PlusJakartaSans",
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontFamily: "PlusJakartaSans",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAllSetScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "All Set",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.darkPurple,
            fontFamily: "PlusJakartaSans",
          ),
        ),
        
        const SizedBox(height: 8),
        
        Text(
          "You're registered as a $_selectedDriverType operating a $_truckType under $_truckBrand.",
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.darkGrey,
            fontFamily: "PlusJakartaSans",
            height: 1.5,
          ),
        ),
        
        const SizedBox(height: 60),
        
        // Continue Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to main app
           
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Continue to Dashboard",
              style: TextStyle(
                fontSize: 20,
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