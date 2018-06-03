public class SuperArray{
  private String[] data;
  private int size;
  //Constructor constructs a blank list with a potential 10 spots;
  public SuperArray(){
    data = new String[10];
    for (int counter = 0; counter < data.length; counter++){
      data[counter] = "";
    }
    size = 0;
  }
  public SuperArray(int startingCapacity){
    data = new String[startingCapacity];
    for (int counter = 0; counter < data.length; counter++){
      data[counter] = "";
    }
    size = 0;
  }
  //Clears entire list, setting every element to null;
  public void clear(){
    for(int counter = 0; counter < data.length; counter++){
      data[counter] = "";
    }
    size = 0;
  }
  //returns the number of non-null elements in the array;
 public int size(){
   return size;
 }
 //checks if the array contains non-null elements;
 public boolean isEmpty(){
   return size == 0;
 }
 //appends an element to the end of the list, calling resize if needed;
 public boolean add(String element){
   if(size == data.length){
  resize();
   }
   data[size] = element;
   size++;
   return true;
 }
 //used to print out the list;
 public String toString(){
   String result = "[";
  for(int counter = 0; counter < size; counter++){
    result+= data[counter];
    if(counter != size - 1){
      result+= ", ";
    }
  }
  result+= "]";
  return result;
}
 //returns the element at a certain index of the list;
 public String get(int index){
   if (index < 0 || index >= size){
   throw new IndexOutOfBoundsException();
   }
   else{
     return data[index];
   }
 }
 //sets an element at a certain index to another element of choice;
 public String set(int index, String element){
  if (index < 0 || index >= size){
   throw new IndexOutOfBoundsException();
  }
  else {
  String returned = data[index];
   data[index] = element;
   return returned;
 }
 }
 //doubles the size of the superarray for accomodation purposes;
 private void resize(){
   String[] newdata = new String[data.length * 2];
   for(int counter = 0; counter < size; counter++){
     newdata[counter] = data[counter];
   }
   for(int counter2 = size; counter2 < data.length; counter2++){
     newdata[counter2] = "";
   }
   data = newdata;
 }
 //checks if a list contains a certain target string;
 public boolean contains(String target){
   for(int counter = 0; counter < size; counter++){
     if(data[counter].equals(target)){
       return true;
     }
   }
   return false;
 }
 //returns the index of the first instance of an element;
 public int indexOf(String target){
   for(int counter = 0; counter < size; counter++){
     if(data[counter].equals(target)){
       return counter;
     }
   }
   return -1;
 }
 //returns the last index of an element;
 public int lastIndexOf(String target){
   for(int counter = size - 1; counter > 0; counter--){
     if(data[counter].equals(target)){
       return counter;
     }
   }
   return -1;
 }
 //inserts an element into a string, bumping elements accordingly;
 //public void add(int index, String element){
  // if (index < 0 || size < index){
  //   throw new IndexOutOfBoundsException();
   //}
  // else {
  //   for(int counter = size; counter >= index; counter--){
    //   data[counter + 1] = data[counter];
     //}
    // data[index] = element;
    // size++;
  // }
 //}
 public void add(int index, String element){
if (index < 0 || index > size()){
   throw new IndexOutOfBoundsException();
}
if (data.length == size()){
   resize();
}
String[] data2 = new String[data.length];
for (int x = 0; x < index; x++){
   data2[x] = data[x];
}
data2[index] = element;
for (int x = index; x < size(); x++){
   data2[x + 1] = data[x];
}
data = data2;
size = size + 1;
 }
 //removes an element from a list at a certain index, shifts list accordingly;
 public String remove(int index){
    if (index < 0 || index >= size){
      throw new IndexOutOfBoundsException();
  }
  String[] answer = new String[data.length];
  resize();
  for(int counter = 0; counter < index; counter++){
    answer[counter] = data[counter];
  }
  for(int counter2 = index; counter2 < size - 1; counter2++){
    answer[counter2] = data[counter2 + 1];
  }
 String removed = data[index];
  data = answer;
  size--;
  return removed;
}
//removes the first instance of a certain element and shifts list accordingly;
public boolean remove(String element){
  if(!contains(element)) {
    return false;
  }
  else{
    int indx = indexOf(element);
    String inx = data[indx];
    String[] answer = new String[size - indx + 1];
    int var =0;
    for(int counter = indx + 1; counter< size; counter++){
      answer[indx] = data[counter];
      var++;
    }
    return true;
    }
  }
}
