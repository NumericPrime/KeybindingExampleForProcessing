//This is the same KeyBinding class used in Example 2
public class KeyBinding {
  //Does ____ have to be pressed for the key combination
  public boolean forceShift=false;
  public boolean forceAlt=false;
  public boolean forceCrtl=false;
  //Does ____ have to not be pressed for the key combination
  public boolean forbidShift=false;
  public boolean forbidAlt=false;
  public boolean forbidCrtl=false;
  //Letter of char to be pressed for the combination if the combination consists only of Shift, Alt or Crtl -1 is used.
  public int keyCodeToBePressed=-1;
  //Assures that the code is only executed once if the combination is pressed. (Only used, when keyCodeToBePressed<0)
  private boolean currentlyActive=false;
  //code to be executed
  Runnable binding;
  public KeyBinding(Runnable binding) {
    this.binding=binding;
  }
  //Setter methods used to construct a key binding
  public KeyBinding setChar(char key_) {
    keyCodeToBePressed=java.awt.event.KeyEvent.getExtendedKeyCodeForChar(key_);
    return this;
  }
  public KeyBinding setForceShift(boolean value) {
    forceShift=value;
    return this;
  }
  public KeyBinding setForceAlt(boolean value) {
    forceAlt=value;
    return this;
  }
  public KeyBinding setForceCrtl(boolean value) {
    forceCrtl=value;
    return this;
  }
  public KeyBinding setForbidShift(boolean value) {
    forbidShift=value;
    return this;
  }
  public KeyBinding setForbidAlt(boolean value) {
    forbidAlt=value;
    return this;
  }
  public KeyBinding setForbidCrtl(boolean value) {
    forbidCrtl=value;
    return this;
  }
  //Uses registerMethod to activate a keyBinding
  public KeyBinding bind() {
    registerMethod("keyEvent", this);
    return this;
  }
  //Uses unregisterMethod to deactivate a keyBinding
  public KeyBinding unbind() {
    unregisterMethod("keyEvent", this);
    return this;
  }
  public void keyEvent(KeyEvent e) {
    //Check, if all prerequisites concerning Shift,Alt,Crtl are fullfilled.
    boolean prerequisites=true;
    if (forceShift&&prerequisites) prerequisites=e.isShiftDown();
    if (forceAlt&&prerequisites) prerequisites=e.isAltDown();
    if (forceCrtl&&prerequisites) prerequisites=e.isControlDown();
    if (forbidShift&&prerequisites) prerequisites=!e.isShiftDown();
    if (forbidAlt&&prerequisites) prerequisites=!e.isAltDown();
    if (forbidCrtl&&prerequisites) prerequisites=!e.isControlDown();
    //If the prerequisites aren't present the key combination is noted as 'not pressed'
    if (!prerequisites) {
      currentlyActive=false;
      return;
    }
    //If no additional key was required and the key-binding isn't already pressed execute the code.
    if (keyCodeToBePressed<0&&!currentlyActive) {
      binding.run();
      currentlyActive=true;
      return;
    }
    //If the demanded key is pressed run the code
    if (e.getKey()==keyCodeToBePressed&&e.getAction()==KeyEvent.PRESS) {
      binding.run();
      return;
    }
  }
}
