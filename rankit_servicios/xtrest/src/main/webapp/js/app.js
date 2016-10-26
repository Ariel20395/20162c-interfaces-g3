'use strict';
var rankitApp = angular.module('rankitApp', ['ui.router', 'ngResource']);

/* Controllers */
rankitApp.controller('BusquedaController', function ($resource, Ranking) {

    this.ranking = {
        nombre : '',
        tipo : '',
        calificaciones : '',
        ranking : '' 
    };
    
    this.tiposDeOfrecidos = [
        {id: '1', tipo:'SERVICIO'},
        {id: '2', tipo:'LUGAR'}
    ];
    
    this.resultados = [];
    
    this.actualizarResultados = function() {
        Ranking.query(function(data) {
            this.resultados = data;
        }, errorHandler);
    };
    
    this.actualizarResultados();
    
    this.buscar = function (ranking) {
        this.actualizarResultados();
        this.tipo = '';
    };

    function errorHandler(error) {
        this.notificarError(error.data);
    }

    this.errors = [];
    this.notificarError = function(mensaje) {
        this.errors.push(mensaje);
        this.notificar(this.errors);
    };

    this.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    }
});


rankitApp.controller('LoginController', function($state, LoginService) {
   
    this.usuario = {
        'nombreUsuario' : '',
        'passwordUsuario' : ''
    };
    
    this.login = function() {
        LoginService.login(this.usuario);
    };
    
    this.registrarse = function() {
        LoginService.registrar(this.usuario);
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