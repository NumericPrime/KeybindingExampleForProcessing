/*
A common method used in libraries is registerMethod. This allows a library 
to have methods executed e.g. after every iteration of draw. This technique can also be used in sketches however.
*/
RegisteringClass rc=new RegisteringClass();
void setup(){
  //to register a method you must give the event type. Also you have to give the instance of an object.
  //The method with the exact name of the event will be executed with the instance.
  //If there is more than one Object registerMethod is called on then the methods will be executed in the order they were registered.
  registerMethod("draw",rc);
  registerMethod("post",rc);
  registerMethod("pre",rc);
  registerMethod("dispose",rc);
  registerMethod("pause",rc);
  registerMethod("keyEvent",rc);
  registerMethod("mouseEvent",rc);
  registerMethod("touchEvent",rc);
}
void draw(){
  println("DRAW "+frameCount);
  
  //unregistering a method has the same syntax as registering a method you may, if you wish re-register a method.
  if(frameCount==100) unregisterMethod("post",rc);
}
