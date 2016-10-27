'use strict';
var rankitApp = angular.module('rankitApp', ['ui.router', 'ngResource']);

/* Controllers */
rankitApp.controller('BusquedaController', function ($resource, rankitService) {

    var self = this;
    
    this.ranking = {
        nombre: '',
        tipo: '',
        calificaciones: '',
        ranking: '' 
    };
    
    this.tiposDeOfrecidos = [
        {tipo: 'SERVICIO'},
        {tipo: 'LUGAR'}
    ];
    
    this.resultados = [];
    
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


rankitApp.controller('LoginController', function($state) {
   
    this.usuario = {
        'nombreUsuario' : '',
        'passwordUsuario' : ''
    };
    
    this.login = function() {   
    };
    
    this.registrarse = function() {   
    };
    
    this.logout = function() {
        this.usuario = {
            'nombreUsuario' : '',
            'passwordUsuario' : ''
        };
        $state.go("logout");
    };
    
    this.calificar = function() {
        $state.go("calificar");  
    };
});

rankitApp.controller('CalificarController', function(calificacionService) {
    var self = this;
    
    this.calificacion = {
        puntuacion: '',
        detalle: '',
        evaluado: '',
        usuario: ''
    };
    
    this.respuesta = [];
    
    this.getCalificacion = function() {
        calificacionService.finCalificacion(self.ranking, function(response) {
             self.respuesta = response.data;
        });    
    };
    
    this.getCalificacion();
    
});