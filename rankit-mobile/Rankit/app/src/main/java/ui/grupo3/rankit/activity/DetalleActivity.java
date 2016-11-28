package ui.grupo3.rankit.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import ui.grupo3.rankit.R;

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
