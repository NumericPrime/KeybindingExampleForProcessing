import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.*;
import java.util.*;
//This annotation Type will not be deleted when the sketch starts.
@Retention(RUNTIME)
//You can use this annotation on methods
  @Target(METHOD)
  public @interface KeyBind {
  //The properties of the annotations are defined here.
  public char chr() default 0;
  public int keyCode() default -1;
  public boolean forceShift() default false;
  public boolean forceAlt() default false;
  public boolean forceCrtl() default false;
  public boolean forbidShift() default false;
  public boolean forbidAlt() default false;
  public boolean forbidCrtl() default false;
}
