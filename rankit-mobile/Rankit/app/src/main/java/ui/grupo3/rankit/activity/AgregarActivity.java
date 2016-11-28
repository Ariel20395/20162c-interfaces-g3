package ui.grupo3.rankit.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.service.ConectionRest;


/**
 * Created by ariel on 27/11/16.
 */
public class AgregarActivity extends FragmentActivity {

    private String nombreUsuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_agregar);

        Bundle bundle = getIntent().getExtras();
        nombreUsuario = bundle.getString("nombre");

        onClickGuardar();
    }

    private void onClickGuardar() {

        Button guardarCalificacion = (Button) findViewById(R.id.agregarNuevaCalificacion);

        guardarCalificacion.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String puntos   = ((EditText) findViewById(R.id.puntajeNuevaCalificacion)).getText().toString();
                String detalle  = ((EditText) findViewById(R.id.motivoNuevaCalificacion)).getText().toString();
                String evaluado = ((EditText) findViewById(R.id.ofrecidoNuevaCalificacion)).getText().toString();


                ConectionRest.crearService().agregarCalificacion(puntos, detalle, evaluado, nombreUsuario, handlearGuardado());
            }
        });
    }

    private Callback<Void> handlearGuardado() {
        return new Callback<Void>() {
            @Override
            public void success(Void aVoid, Response response) {

                Toast toast = Toast.makeText(getApplicationContext(), "Calificacion creada", Toast.LENGTH_SHORT);

                toast.show();

                setResult(RESULT_OK, new Intent());

                finish();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);

                toast.show();
            }
        };
    }

}
