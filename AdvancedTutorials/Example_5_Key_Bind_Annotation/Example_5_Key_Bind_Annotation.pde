/*
In this example the KeyBind annotation will be made functional.
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

//Checks the class of ref for any mention of KeyBind using reflection. Then keyBinds will be added.
import java.lang.reflect.*;
public void processAnnotation(Object ref) {
  Method[] methods=ref.getClass().getDeclaredMethods();
  for (Method method : methods)
    //Checks if the method has a KeyBind annotation
    if (method.isAnnotationPresent(KeyBind.class)) {
      KeyBind keybindAnnotation=method.getAnnotation(KeyBind.class);
      /*Processing 3 users can replace the lambda expression with:
      new Runnable(){
        @Override
        public void run(){
          try {
            method.invoke(ref);
          }
          catch(Exception e) {
            throw new RuntimeException(e);
          }
        }
      }
      */
      KeyBinding kb=new KeyBinding(
        ()-> {
        try {
          //Executes the method that is annotated
          method.invoke(ref);
        }
        catch(Exception e) {
          throw new RuntimeException(e);
        }
      })
      //Inputs the parameters of the annotation
      .setForceShift(keybindAnnotation.forceShift())
      .setForbidShift(keybindAnnotation.forbidShift())
      .setForceAlt(keybindAnnotation.forceAlt())
      .setForbidAlt(keybindAnnotation.forbidAlt())
      .setForceCrtl(keybindAnnotation.forceCrtl())
      .setForbidCrtl(keybindAnnotation.forbidCrtl());
      if(keybindAnnotation.keyCode()>0) kb.keyCodeToBePressed=keybindAnnotation.keyCode();
      else kb.setChar(keybindAnnotation.chr());
      //Binds the key bind
      kb.bind();
    }
}
