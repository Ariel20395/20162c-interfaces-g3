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
<<<<<<< HEAD
public class LoginActivity extends FragmentActivity implements UsuarioFragment.Callbacks {


    /**
     * Id to identity READ_CONTACTS permission request.
     */
    private static final int REQUEST_READ_CONTACTS = 0;

    /**
     * A dummy authentication store containing known user names and passwords.
     * TODO: remove after connecting to a real authentication system.
     */
    private static final String[] DUMMY_CREDENTIALS = new String[]{
            "foo@example.com:hello", "bar@example.com:world"
    };
    /**
     * Keep track of the login task to ensure we can cancel it if requested.
     */
    private UserLoginTask mAuthTask = null;

    // UI references.
    private AutoCompleteTextView usuarioView;
    private EditText mPasswordView;
    private View mProgressView;
    private View mLoginFormView;
=======
public class LoginActivity extends FragmentActivity{

    private String nombreUsuario;
    private String passwordUsuario;
>>>>>>> ceb5b14627dcd0c830a62618fb9a1fbd2512dae3

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);


        Button usuarioButton = (Button) findViewById(R.id.login_button);
        usuarioButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {

<<<<<<< HEAD
        Button registrarButton = (Button) findViewById(R.id.registrar_button);
        registrarButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                attemptLogin();
            }
        });


        mLoginFormView = findViewById(R.id.login_form);
        mProgressView = findViewById(R.id.login_progress);
    }

    private void populateAutoComplete() {
        if (!mayRequestContacts()) {
            return;
        }
=======
                setUsuario();
>>>>>>> ceb5b14627dcd0c830a62618fb9a1fbd2512dae3

                Usuario usuario = new Usuario(nombreUsuario, passwordUsuario);
                autenticar(usuario);
            }
<<<<<<< HEAD
        }
    }


    /**
     * Attempts to sign in or register the account specified by the login form.
     * If there are form errors (invalid email, missing fields, etc.), the
     * errors are presented and no actual login attempt is made.
     */
    private void attemptLogin() {
        if (mAuthTask != null) {
            return;
        }

        // Reset errors.
        usuarioView.setError(null);
        mPasswordView.setError(null);

        // Store values at the time of the login attempt.
        String usuario = usuarioView.getText().toString();
        String password = mPasswordView.getText().toString();

        boolean cancel = false;
        View focusView = null;

        // Check for a valid password, if the user entered one.
        if (!TextUtils.isEmpty(password)) {
            mPasswordView.setError(getString(R.string.error_invalid_password));
            focusView = mPasswordView;
            cancel = true;
        }

        // Verifica que el usuario existe
        if (TextUtils.isEmpty(usuario)) {
            usuarioView.setError(getString(R.string.error_field_required));
            focusView = usuarioView;
            cancel = true;
        } else if (!isEmailValid(usuario)) {
            usuarioView.setError(getString(R.string.error_invalid_usuario));
            focusView = usuarioView;
            cancel = true;
        }

        if (cancel) {
            // There was an error; don't attempt login and focus the first
            // form field with an error.
            focusView.requestFocus();
        } else {
            // Show a progress spinner, and kick off a background task to
            // perform the user login attempt.
            showProgress(true);
            mAuthTask = new UserLoginTask(usuario, password);
            mAuthTask.execute((Void) null);
        }
    }


=======
        });

        Button registrarButton = (Button) findViewById(R.id.registrar_button);
        registrarButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
>>>>>>> ceb5b14627dcd0c830a62618fb9a1fbd2512dae3

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
                String nombre = autenticado.getNombre();

                Intent calificacionesView = new Intent(this, CalificacionesListActivity.class);
                calificacionesView.putExtra(CalificacionesFragment.NOMBRE_USUARIO, nombre);

                startActivity(calificacionesView);
            }

            @Override
            public void failure(RetrofitError error) {

                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);

                toast.show();
            }
        });
    }


}

