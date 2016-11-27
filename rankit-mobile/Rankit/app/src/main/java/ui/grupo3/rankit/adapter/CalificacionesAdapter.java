package ui.grupo3.rankit.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import ui.grupo3.rankit.R;
import ui.grupo3.rankit.model.Calificacion;

/**
 * Created by migue on 19/11/16.
 */

public class CalificacionesAdapter extends ArrayAdapter<Calificacion> {

    private Context context;
    private int layoutResourceId;
    private List<Calificacion> calificaciones;
    private List<Calificacion> busquedaCalificaciones;

    public CalificacionesAdapter(Context context, int layoutResourceId, List<Calificacion> calificaciones) {
        super(context, layoutResourceId, calificaciones);

        this.context = context;
        this.layoutResourceId = layoutResourceId;
        this.calificaciones = calificaciones;
        this.busquedaCalificaciones = calificaciones;
    }

    public List<Calificacion> getCalificaciones() {
        return calificaciones;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        if(row == null) {
            LayoutInflater inflater = ((Activity) context).getLayoutInflater();
            row = inflater.inflate(layoutResourceId, parent, false);
        }
        Calificacion calificacion = calificaciones.get(position);
        TextView nombreOfrecido = (TextView) row.findViewById(R.id.nombre_ofrecido);
        nombreOfrecido.setText(calificacion.getOfrecido());

        return row;
    }


}

