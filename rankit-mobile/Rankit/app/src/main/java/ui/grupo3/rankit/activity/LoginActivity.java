package ui.grupo3.rankit.activity;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import android.support.design.widget.Snackbar;

import android.content.CursorLoader;
import android.content.Loader;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;

import android.os.Build;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.FragmentActivity;
import android.telecom.Call;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.model.ConectionRest;
import ui.grupo3.rankit.model.EntidadDominioTo;
import ui.grupo3.rankit.model.Usuario;
import ui.grupo3.rankit.service.RankitService;

import static android.Manifest.permission.READ_CONTACTS;

/**
 * A login screen that offers login via email/password.
 */
public class LoginActivity extends FragmentActivity{

    private String nombreUsuario;
    private String passwordUsuario;
    private String nombreAutenticado;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);


        Button loginButton = (Button) findViewById(R.id.login_button);
        loginButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {

                setUsuario();

                Usuario usuario = new Usuario(nombreUsuario, passwordUsuario);
                autenticar(usuario);
                if(nombreAutenticado != null) {

                    Intent calificacionesView = new Intent(view.getContext(), CalificacionesListActivity.class);
                    calificacionesView.putExtra("nombreUsuario", nombreAutenticado);

                    startActivity(calificacionesView);
                }
            }
        });

        Button registrarButton = (Button) findViewById(R.id.registrar_button);
        registrarButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {

                setUsuario();

                Usuario usuario = new Usuario(nombreUsuario, passwordUsuario);
                registrar(usuario);
            }
        });

    }

    private void setUsuario() {
        nombreUsuario = ((EditText) findViewById(R.id.usuario)).getText().toString();
        passwordUsuario = ((EditText)findViewById(R.id.password)).getText().toString();
    }

    protected void registrar(Usuario usuario) {
        ConectionRest.crearService().registrarUsuario(usuario, handlearRegisto());
    }

    protected Callback<Void> handlearRegisto(){
        return new Callback<Void>() {
            @Override
            public void success(Void aVoid, Response response) {
                // Muestra mensaje que se creo el usuario
                Toast toast = Toast.makeText(getApplicationContext(), "Usuario creado", Toast.LENGTH_SHORT);

                toast.show();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);

                toast.show();
            }
        };

    }

    protected void autenticar(Usuario usuario) {
        ConectionRest.crearService().loginUsuario(usuario, new Callback<EntidadDominioTo>() {
            @Override
            public void success(EntidadDominioTo autenticado, Response response) {
                nombreAutenticado = autenticado.getNombre();

            }

            @Override
            public void failure(RetrofitError error) {

                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);

                toast.show();
            }
        });
    }


}

