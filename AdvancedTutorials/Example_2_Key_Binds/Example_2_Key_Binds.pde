/*
This sketch shows a possible application of registerMethod.
In this example registerMethod is used to access the KeyEvent.
 */
void setup() {
  //For Processing 3 replace this::met with the following:
  /*
  new Runnable(){
    @Override
    public void run(){
      met();
    }
  }
  */
  //One may also use other lambda expressions.
  new KeyBinding(this::met)
    .setChar('a')
    .setForceShift(true)
    .bind();
}
void draw() {
}

void met() {
  println("shift+a has been pressed");
}
