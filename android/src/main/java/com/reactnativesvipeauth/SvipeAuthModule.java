package com.reactnativesvipeauth;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import org.json.JSONObject;

import se.svipe.svipekit.models.IdentityDocument;

class SvipeAuthModule extends ReactContextBaseJavaModule {

  private final static String KEY_DOCUMENT_NUMBER = "documentNumber";
  private final static String KEY_NATIONALITY = "nationality";
  private final static String KEY_LAST_NAME = "lastName";
  private final static String KEY_FIRST_NAME = "firstName";
  private final static String KEY_DATE_OF_BIRTH = "dateOfBirth";
  private final static String KEY_GENDER = "gender";
  private final static String KEY_DOCUMENT_EXPIRY_DATE = "documentExpiryDate";

  public SvipeAuthModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @ReactMethod
  public void scanDocument(IdentityDocument identityDocument, Promise promise) {
    Activity activity = this.getCurrentActivity();
    Context context = null;
    if (activity != null) {
      context = activity.getApplicationContext();
    }

    try {
      JSONObject jsonDocument = new JSONObject();
      jsonDocument.accumulate(KEY_DOCUMENT_NUMBER, identityDocument.getDocumentNumber());
      jsonDocument.accumulate(KEY_NATIONALITY, identityDocument.getNationality());
      jsonDocument.accumulate(KEY_LAST_NAME, identityDocument.getSurname());
      jsonDocument.accumulate(KEY_FIRST_NAME, TextUtils.join(" ", identityDocument.getNames()));
      jsonDocument.accumulate(KEY_DATE_OF_BIRTH, identityDocument.getDateOfBirth());
      jsonDocument.accumulate(KEY_GENDER, identityDocument.getGender().getName(context));
      jsonDocument.accumulate(KEY_DOCUMENT_EXPIRY_DATE, identityDocument.getExpirationDate());

      promise.resolve(jsonDocument);
    } catch (Exception e) {
      promise.reject(e);
    }
  }

  @Override
  public String getName() {
    return "SvipeAuth";
  }

}
