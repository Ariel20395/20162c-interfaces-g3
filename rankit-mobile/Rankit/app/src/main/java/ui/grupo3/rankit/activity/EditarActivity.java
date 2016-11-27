package ui.grupo3.rankit.activity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.media.session.MediaControllerCompat;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.service.ConectionRest;

/**
 * Created by ariel on 24/11/16.
 */
public class EditarActivity extends FragmentActivity {

    protected String  nombre;
    protected String  detalle;
    protected String  puntos;
    protected int     id;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editar);

        setExtras();

        cargarDetalle();

        onClickGuardar();
    }

    private void onClickGuardar() {

        final Button guardar = (Button) findViewById(R.id.guardar);
        guardar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                guardarCalificacion();
            }
        });

    }

    private void guardarCalificacion() {

        puntos = ((EditText) findViewById(R.id.nuevoPuntaje)).getText().toString();
        detalle = ((EditText) findViewById(R.id.nuevoMotivo)).getText().toString();
        String idCalificacion = String.valueOf(id);

        ConectionRest.crearService().editarCalificacion(idCalificacion, puntos, detalle, nombre, handlearGuardado());
    }

    private Callback<Void> handlearGuardado() {
        return new Callback<Void>() {
            @Override
            public void success(Void aVoid, Response response) {

                Toast toast = Toast.makeText(getApplicationContext(), "Calificacion Modificada", Toast.LENGTH_SHORT);

                toast.show();

                Intent data = new Intent();
                data.putExtra("puntos", puntos);
                data.putExtra("detalle", detalle);
                setResult(RESULT_OK, data);

                finish();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);

                toast.show();
            }
        };
    }

    private void cargarDetalle() {

        ((TextView) findViewById(R.id.nombre)).setText(nombre);
        ((TextView) findViewById(R.id.nuevoMotivo)).setText(detalle);
        ((TextView) findViewById(R.id.nuevoPuntaje)).setText(puntos);

    }

    protected void setExtras() {
        Bundle bundle = getIntent().getExtras();
        this.nombre = bundle.getString("nombreCalificacion");
        this.detalle = bundle.getString("detalle");
        this.id = bundle.getInt("id");
        this.puntos = String.valueOf(bundle.getInt("puntos"));
    }


}
