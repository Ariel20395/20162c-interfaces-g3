rankitApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
        .state('logout', {
            url: '/',
            views: {
                'header': {
                    templateUrl: '/partials/logout.html',
                    controller: "LoginController as LoginCtrl"
                },
                'panelBusqueda': {
                    templateUrl: "partials/busqueda.html",
                    controller: "BusquedaController as busquedaCtrl"
              }
            }
        })
};

    
  /*
    .state('logout', {
      url: "/",
      templateUrl: "partials/noLogin.html",
      controller: "loginController as loginCtrl"
    })

    .state('login', {
      url: "/:id",
      templateUrl: "partials/login.html",
      controller: "LoginController as LoginCtrl"
  })

  .state('busqueda', {
      url: "/:id",
      templateUrl: "partials/search.html",
      controller: "BusquedaController as busquedaCtrl"
    })
  
  .state('calificar', {
      url: "/:id",
      templateUrl: "partials/calificar.html",
      controller: "SearchController as searchCtrl"
    })
  */