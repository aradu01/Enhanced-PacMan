public String show(char[][] array) {
  String result = "[";
  
  for (int row = 0; row < array.length; row++) {
    for (int col = 0; col < array[row].length; col++) {
      result += array[row][col] + ", ";
    }
    
    result += "\n";
  }
  
  return result + "]";
}
