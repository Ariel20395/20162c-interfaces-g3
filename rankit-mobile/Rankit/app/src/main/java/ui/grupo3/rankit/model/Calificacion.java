package ui.grupo3.rankit.model;

import java.util.Random;

/**
 * Created by migue on 15/11/16.
 */

public class Calificacion {
    private Integer id;
    private Integer puntos;
    private String detalle;
    private String usuario;
    private String ofrecido;

    public Calificacion(Integer unosPuntos, String unDetalle, String unNombreDeUsuario, String unNombreDeOfrecido) {
        this.id = new Random().nextInt(1000);
        this.puntos = unosPuntos;
        this.detalle = unDetalle;
        this.usuario = unNombreDeUsuario;
        this.ofrecido = unNombreDeOfrecido;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer unId) {
        this.id = unId;
    }

    public Integer getPuntos() {
        return this.puntos;
    }

    public void setPuntos(Integer unosPuntos) {
        this.puntos = unosPuntos;
    }

    public String getDetalle() {
        return this.detalle;
    }

    public void setDetalle(String unDetalle) {
        this.detalle = unDetalle;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public void setUsuario(String unNombreDeUsuario) {
        this.usuario = unNombreDeUsuario;
    }

    public String getOfrecido() {
        return this.ofrecido;
    }

    public void setOfrecido(String unNombreDeOfrecido) {
        this.ofrecido = unNombreDeOfrecido;
    }
}
