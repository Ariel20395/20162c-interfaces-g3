package ui.grupo3.rankit.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.service.ConectionRest;
import ui.grupo3.rankit.model.EntidadDominioTo;
import ui.grupo3.rankit.model.Usuario;


public class LoginActivity extends FragmentActivity{

    private String nombreUsuario;
    private String passwordUsuario;

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
        ConectionRest.crearService().loginUsuario(usuario, handlearAutenticar());
    }

    protected Callback<EntidadDominioTo> handlearAutenticar() {
        return new Callback<EntidadDominioTo>() {
            @Override
            public void success(EntidadDominioTo autenticado, Response response) {
                String nombreAutenticado = autenticado.getNombre();

                Intent calificacionesView = new Intent(LoginActivity.this, CalificacionesListActivity.class);
                calificacionesView.putExtra("nombreUsuario", nombreAutenticado);

                startActivity(calificacionesView);

            }

            @Override
            public void failure(RetrofitError error) {

                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);

                toast.show();
            }
        };
    }


}
