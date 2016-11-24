package ui.grupo3.rankit.activity;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detalle);

        if (savedInstanceState == null) {
            Bundle bundle = getIntent().getExtras();
            if (bundle != null) {
                this.nombre = bundle.getString("nombreCalificacion");
                this.detalle = bundle.getString("detalle");
                this.id = bundle.getInt("id");
                this.puntos = bundle.getInt("puntos");
            }
        }

        cargarDetalle();

        onClickEditar();
     }

    private void onClickEditar() {
        Button editar = (Button) findViewById(R.id.editar);
    }

    private void cargarDetalle() {

        ((TextView)findViewById(R.id.nombre)).setText(nombre);
        ((TextView)findViewById(R.id.cantidadPuntos)).setText(String.valueOf(puntos));
        ((TextView)findViewById(R.id.detalleOfrecido)).setText(detalle);
    }
}
