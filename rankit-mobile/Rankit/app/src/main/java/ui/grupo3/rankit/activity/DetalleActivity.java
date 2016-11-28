package ui.grupo3.rankit.activity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.AlertDialog;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.service.ConectionRest;

/**
 * Created by migue on 24/11/16.
 */
public class DetalleActivity extends FragmentActivity{

    private String nombre;
    private String detalle;
    private int puntos;
    private int id;
    private int request_code = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detalle);

        setExtras();

        cargarDetalle();

        onClickEditar();

        onClickEliminar();
     }

    private void onClickEliminar() {
        Button eliminar = (Button) findViewById(R.id.eliminar);
        eliminar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                AlertDialog.Builder confirmacion = new AlertDialog.Builder(DetalleActivity.this);

                confirmacion.setMessage("¿Desea eliminar la calificación?");

                confirmacion.setPositiveButton("Si", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogo, int arg1) {
                        String idCalificacion = String.valueOf(id);
                        ConectionRest.crearService().eliminarCalificacion(idCalificacion, handlearEliminacion());
                    }
                });

                confirmacion.setNegativeButton("No", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogo, int arg1) {
                        dialogo.cancel();
                    }
                });

                confirmacion.show();
            }
        });
    }

    private Callback<Void> handlearEliminacion() {
        return new Callback<Void>() {
            @Override
            public void success(Void aVoid, Response response) {

                Toast toast = Toast.makeText(getApplicationContext(), "Calificación eliminada", Toast.LENGTH_SHORT);
                toast.show();

                Intent data = new Intent();
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


    protected void setExtras() {
        Bundle bundle = getIntent().getExtras();
        this.nombre = bundle.getString("nombreCalificacion");
        this.detalle = bundle.getString("detalle");
        this.id = bundle.getInt("id");
        this.puntos = bundle.getInt("puntos");
    }

    private void onClickEditar() {
        Button editar = (Button) findViewById(R.id.editar);
        editar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent editarView = new Intent(DetalleActivity.this, EditarActivity.class);

                Bundle extras = new Bundle();
                extras.putString("nombreCalificacion", nombre);
                extras.putString("detalle", detalle);
                extras.putInt("puntos", puntos);
                extras.putInt("id", id);
                editarView.putExtras(extras);

                startActivityForResult(editarView, request_code);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if ((requestCode == request_code) && (resultCode == RESULT_OK)){
            Bundle extras = data.getExtras();
            ((TextView) findViewById(R.id.cantidadPuntos)).setText(extras.getString("puntos"));
            ((TextView) findViewById(R.id.detalleOfrecido)).setText(extras.getString("detalle"));
        }
    }

    private void cargarDetalle() {

        ((TextView)findViewById(R.id.nombre)).setText(nombre);
        ((TextView)findViewById(R.id.cantidadPuntos)).setText(String.valueOf(puntos));
        ((TextView)findViewById(R.id.detalleOfrecido)).setText(detalle);
    }
}
