rankitApp.service("BusquedaService", function() {
   
    this.calificaciones = [
      { "evaluado": { "id": 336, "nombre": "Netflix", "tipo": "SERVICIO" }, "ranking": 8, "calificaciones": 2 },
      { "evaluado": { "id": 996, "nombre": "Cablevisión", "tipo": "SERVICIO" }, "ranking": 8, "calificaciones": 1 },
      { "evaluado": { "id": 961, "nombre": "TeleCentro", "tipo": "SERVICIO" }, "ranking": 7, "calificaciones": 3 },
      { "evaluado": { "id": 850, "nombre": "CorreoArgentino", "tipo": "LUGAR" }, "ranking": 9, "calificaciones": 3},
      { "evaluado": { "id": 901, "nombre": "Hoyts General Cinema", "tipo": "LUGAR" }, "ranking": 8, "calificaciones": 4 }
    ];
    
    this.tipos = [
        {id: '1', tipo:'SERVICIO'},
        {id: '2', tipo:'LUGAR'}
    ];
    
    this.buscar = function(ofrecidoBuscado, tipoBuscado, rankingBuscado, calificacionBuscada){
        return _.find( this.calificaciones, function(calificacion) {
            return calificacion.evaluado.nombre.contains(this.ofrecidoBuscado) &&
            calificacion.evaluado.tipo.contains(this.tipoBuscado) &&
            calificacion.ranking.contains(this.rankingBuscado) &&
            calificacion.calificaciones.contains(this.calificacionBuscado); 
        });    
    };
    
});