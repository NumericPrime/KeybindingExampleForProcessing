//Every class that registers a method has to be declared public
public class RegisteringClass{
  //Every registered method has to be declared public
  //Every method has to have the same arguments as the ones given here (the names may be different but the types must be the same)
  
  //This method is executed after draw
  public void draw(){
    println("draw was just executed");
  }
  //This method is executed after draw and after the registered draw methods
  public void post(){
    println("draw was just executed as well as the registered draw method. (This method will be removed at the 100th frame)");
  }
  //This method is executed before draw
  public void pre(){
    println("\ndraw is about to be executed");
  }
  //This method is executed when exit is called
  public void dispose(){
    println("exit has been called");
  }
  //This method is executed when a key event occurrs
  public void keyEvent(KeyEvent e){
    println("There was a key event");
  }
  //This method is executed when a mouse event occurrs
  public void mouseEvent(MouseEvent e){
    println("There was a mouse event");
  }
  //This method is executed when a touch event occurrs
  public void touchEvent(TouchEvent e){
    println("There was a touch event");
  }
  //This method is executed when the sketch is paused
  public void pause(){
    println("There sketch was paused");
  }
}
