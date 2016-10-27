rankitApp.service('rankitService', function($http) {
    this.findAll = function(callback) {
        $http.get('/ranking').then(callback);
    }
    
    this.findRanking = function(ranking, callback) {
     $http.get('/ranking?nombre='+ranking.nombre + 
               '&tipo=' + ranking.tipo +
               '&calificaciones='+ ranking.calificaciones +
               '&ranking='+ ranking.ranking).then(callback)
}

});

rankitApp.service('calificacionService', function($http) {
    this.finCalificacion = function(calificacion, callback) {
        $http.get('/calificaciones?usuario='+ calificacion.usuario).then(callback)  
    }
});