package ui.grupo3.rankit.adapter;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import java.util.List;

import ui.grupo3.rankit.R;
import ui.grupo3.rankit.model.Calificacion;

/**
 * Created by migue on 19/11/16.
 */

public class CalificacionAdapter extends AbstractListAdapter<Calificacion> {
    public CalificacionAdapter(Context context, List<Calificacion> calificaciones) {
        super(context, calificaciones);
    }
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Calificacion calificacion = (Calificacion) getItem(position);
        View row = generateRow(R.layout.activity_calificaciones_list, parent);
        setColumnTextView(row, R.id.nombreOfrecido, calificacion.getOfrecido());
        return row;
    }

}

