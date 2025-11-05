import 'package:flutter/foundation.dart';

class GridNotifier extends ChangeNotifier {
  bool _isGrid = true;
  bool _isGridActive = true;
  bool _isListActive = false;
  
  bool get isGrid => _isGrid;
  bool get isGridActive => _isGridActive;
  bool get isListActive => _isListActive;
  
  void changeGrid() {
    _isGrid = !_isGrid; // Fixed: Use assignment and logical NOT operator
    _isGridActive = _isGrid? true: false;
    _isListActive = _isGrid? false: true;
    
    notifyListeners(); 
   // This will now print the correct value
  }
  
  void reset() {
    _isGrid = true;
    notifyListeners();
  }
}