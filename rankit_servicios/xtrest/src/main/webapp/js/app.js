'use strict';
var rankitApp = angular.module('rankitApp', ['ui.router', 'ngAnimate']);

/* Controllers */
rankitApp.controller('BusquedaController', function (rankitService) {

    var self = this;
    
    this.ranking = {
        nombre: '',
        tipo: '',
        calificaciones: '',
        ranking: '' 
    };
    
    this.tiposDeOfrecidos = [
        {tipo:'SERVICIO'},
        {tipo:'LUGAR'}
    ];
    
    this.resultados = [];
    
    this.cantidadDeResultados = function() {
        return self.resultados.length;
    };
    
    this.getRanking = function() {
	    rankitService.findAll(function(response) {
            self.resultados = response.data;
	    });
    };
    
    this.getRanking();
        
    this.buscar = function () {
        rankitService.findRanking(self.ranking, function(response) {
            self.resultados = response.data;
        }); 
    };

});


rankitApp.controller('LoginController', function($state, usuarioService, calificacionService, $timeout) {
    
    var self = this;
   
    this.usuario = {
        'nombreUsuario' : '',
        'passwordUsuario' : ''
    };
    
    this.idUsuario = {};
    this.errors = [];
    
    this.login = function() {
        usuarioService.loguearUsuario(self.usuario)
        .success(function(data){
            console.log(data);
            self.idUsuario = data;
            $state.go("login");
        })
        .error(function(err){
            console.log(err);
            self.notificarError(err);
        });
    };
    
    this.registrarse = function() {   
        usuarioService.registrarUsuario(self.usuario)
        .success(function(data){
            console.log(data);
        })
        .error(function(err){
            console.log(err);
            self.notificarError(err);
        });
    };
    
    this.logout = function() {
        this.usuario = {
            'nombreUsuario' : '',
            'passwordUsuario' : ''
        };
        this.idUsuario = {};
        $state.go("logout");
    };
    
    this.calificar = function() {
        $state.go("calificar");
        this.getCalificaciones();
    };
    
    this.getNombreUsuario = function() {
        return this.usuario.nombreUsuario;
    }
    
    this.notificarError = function(mensaje) {
        this.errors.push(mensaje);
        this.notificar(this.errors);
    };

    this.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    }
    
    /// CALIFICAR
    this.calificacion = {
        puntuacion: '',
        detalle: '',
        evaluado: '',
        usuario: self.usuario.nombreUsuario
    };
    
    this.calificacionesDeUsuario = [];
    
    this.getCalificaciones = function() {
        calificacionService.findCalificacion(self.usuario, function(response) {
             self.calificacionesDeUsuario = response.data;
        });    
    };
    
    this.nuevaCalificacion = function() {
        calificacionService.crearCalificacion(self.calificacion)
            .success(function(data){
                self.getCalificaciones();
        })
            .error(function(err){
                self.notificarError(err);    
        });
    }
    
    this.getCalificaciones();
    
});