package ui.grupo3.rankit.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by migue on 15/11/16.
 */

public class Usuario {
    private Integer id;
    private String nombre;
    private String password;
    private List<Calificacion> calificaciones;

    public Usuario(String nombre, String password) {
        this.id = new Random().nextInt(1000);
        this.nombre = nombre;
        this.password = password;
        this.calificaciones = new ArrayList<Calificacion>();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer unId) {
        this.id = unId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String unNombre) {
        this.nombre = unNombre;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String unPassword) {
        this.password = unPassword;
    }
}
