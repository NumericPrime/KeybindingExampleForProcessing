/*
Every class declared in a Processing sketch is considered a "inner class". This class is considered a property of a instance
 (in this case a property of the sketch) rather than it's only class.
 However one can declare create a .java tab to declare a class "disconnected" from this sketch.
 This class can't access the methods provided by processing unless a reference to the sketch is present.
 Some things however are only possible with a .java tab.
 
 In this example an annotation type is created that will later be used for keyBindings
 */

void setup() {
  processAnnotation(this);
}
void draw() {
}
@KeyBind(chr='a', forceShift=true)
  public void method() {
  println("Shift a was pressed");
}

//Checks the class of ref for any mention of KeyBind using reflection
import java.lang.reflect.*;
public void processAnnotation(Object ref) {
  Method[] methods=ref.getClass().getDeclaredMethods();
  for (Method method : methods)
    //Checks if the method has a KeyBind annotation
    if (method.isAnnotationPresent(KeyBind.class)) {
      println("KeyBind annotation is present at: "+method);
    }
}
