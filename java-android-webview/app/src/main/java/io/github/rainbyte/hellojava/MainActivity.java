package io.github.rainbyte.hellojava;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class MainActivity extends Activity {

    private String loadTextAsset(String fileName) {
        StringBuilder builder = new StringBuilder();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(
                new InputStreamReader(
                    getAssets().open(fileName), "UTF-8"));
            String line;
            while((line=reader.readLine()) != null){
                builder.append(line);
            }
        } catch (IOException e) {
            //log the exception
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    //log the exception
                }
            }
        }
        return builder.length() == 0 ? null : builder.toString();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        WebView webView = findViewById(R.id.webview);
        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webView.loadDataWithBaseURL("file:///android_asset/",
                loadTextAsset("index.html"), "text/html",
                "UTF-8", null);
    }
}
