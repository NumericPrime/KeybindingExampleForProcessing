/*
A commonly used technique when writing generic code is called reflection.
 This is a type of meta-code that allows you to e.g. reference a method by name.
 This is also used in the processing source code like e.g. in the implemenetation of registerMethod
 This example will show the basics of reflection.
 */

//Imports the reflection library
import java.lang.reflect.*;

//The methods used in this example are declared public, so it is easier to access them.
public void method() {
  println("method has been executed");
}
public void methodwitharg(int i) {
  println("methodwitharg("+i+") was called");
}
//The field in this example is also declared public 
public int field=0;

void setup(){
  //Gets the handle for the field
  Field field_F=findPublicField(this.getClass(),"field");
  
  //Prints the value of the field
  println(getField(field_F,this));
  //Overrides the field
  setField(field_F,this,2);
  //Prints the new value of the field
  println(getField(field_F,this));
  
  //Gets the handle for the methods.
  //The first Method takes no arguments so an empty array is given as arg-type
  Method method_M=findPublicMethod(this.getClass(),"method",new Class[]{});
  //The first Method takes no arguments so an empty array is given as arg-type
  Method methodwitharg_M=findPublicMethod(this.getClass(),"methodwitharg",new Class[]{int.class});
  //Invokes the methods
  invokeMethod(method_M,this,new Object[]{});
  invokeMethod(methodwitharg_M,this,new Object[]{2});
}

//This returns a public method from the class cls, name and the argtypes.
Method findPublicMethod(Class cls, String name, Class[] argtypes) {
  //When using getMethod you need to account for the case the method doesn't exist.
  try {
    return cls.getMethod(name, argtypes);
  }
  catch(NoSuchMethodException e) {
    System.err.println("The Method "+name+" of "+cls+" doesn't exist.");
    throw new RuntimeException(e);
  }
}

//This invokes a given Method with on instance
Object invokeMethod(Method m, Object instance, Object[] args) {
  try {
    return m.invoke(instance, args);
  }
  catch(IllegalAccessException e) {
    System.err.println("You weren't supposed to be able to execute this method");
    throw new RuntimeException(e);
  }
  catch(InvocationTargetException e) {
    System.err.println("An exception occurred while executing the method.");
    throw new RuntimeException(e);
  }
}


//This returns a public method from the class cls, name and the argtypes.
Field findPublicField(Class cls, String name) {
  //When using getMethod you need to account for the case the method doesn't exist.
  try {
    return cls.getField(name);
  }
  catch(NoSuchFieldException e) {
    System.err.println("The Field "+name+" of "+cls+" doesn't exist.");
    throw new RuntimeException(e);
  }
}

//This invokes a given Method with on instance
Object getField(Field f, Object instance) {
  try {
    return f.get(instance);
  }
  catch(IllegalAccessException e) {
    System.err.println("You weren't supposed to access this Field");
    throw new RuntimeException(e);
  }
}

//This invokes a given Method with on instance
void setField(Field f, Object instance,Object value) {
  try {
    f.set(instance,value);
  }
  catch(IllegalAccessException e) {
    System.err.println("You weren't supposed to access this Field");
    throw new RuntimeException(e);
  }
}
