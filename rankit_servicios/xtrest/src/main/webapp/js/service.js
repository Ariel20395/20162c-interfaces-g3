rankitApp.service('rankitService', function($http) {
    
    this.findAll = function(callback) {
        $http.get('/ranking').then(callback);
    };
    
    this.findRanking = function(ranking, callback) {
     $http.get('/ranking?nombre='+ranking.nombre + 
               '&tipo=' + ranking.tipo +
               '&calificaciones='+ ranking.calificaciones +
               '&ranking='+ ranking.ranking).then(callback);
    };

});


rankitApp.service('usuarioService', function($http) {
    
    this.loguearUsuario = function(usuario) {
        return $http.post('/usuarios', {nombre: usuario.nombreUsuario, password: usuario.passwordUsuario});
    };
    
    this.registrarUsuario = function(usuario) {
        return $http.put('/usuarios', {nombre: usuario.nombreUsuario, password: usuario.passwordUsuario});
    };
});
