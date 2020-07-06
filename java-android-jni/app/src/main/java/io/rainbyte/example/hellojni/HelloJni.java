package io.rainbyte.example.hellojni;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class HelloJni extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        /* Retrieve our TextView and set its content.
         * the text is retrieved by calling a native
         * function.
         */
        setContentView(R.layout.activity_hello_jni);
        TextView textView = findViewById(R.id.hello_textview);
        textView.setText( stringFromJNI() );
    }
    /* A native method that is implemented by the
     * 'hello-jni' native library, which is packaged
     * with this application.
     */
    public native String  stringFromJNI();

    /* This is another native method declaration that is *not*
     * implemented by 'hello-jni'. This is simply to show that
     * you can declare as many native methods in your Java code
     * as you want, their implementation is searched in the
     * currently loaded native libraries only the first time
     * you call them.
     *
     * Trying to call this function will result in a
     * java.lang.UnsatisfiedLinkError exception !
     */
    public native String  unimplementedStringFromJNI();

    /* this loads the 'hello-jni' library on application startup.
     * Lib is in /data/data/io.rainbyte.example.hellojni/lib/libhello-jni.so
     */
    static {
        System.loadLibrary("hello-jni");
    }
}
