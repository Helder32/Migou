<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app_name', 'MigouLib') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/index.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">

</head>

<body>

    
    <!-- div which contains the backround-image -->
    <div class="bg">
        
        <!-- content of the sidenav --> 
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

            <a href="{{ route('home') }}">{{ __('Accueil') }}</a>
            
            <a href="{{ route('login') }}">{{ __('Login') }}</a>
            
            <a href="{{ route('register') }}">{{ __('Register') }}</a>
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
                    aria-expanded="false">Vente librairie</a>
                    <div class="dropdown-menu dropdown-dark" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Ticket de caisse</a>
                        <a class="dropdown-item" href="#">Facture comptant</a>
                        <a class="dropdown-item" href="#">Bon de livraison</a>
                        <a class="dropdown-item" href="#">Facture différée</a>
                        <a class="dropdown-item" href="#">Devis</a>
                    </div>
            </li>
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
                    aria-expanded="false">Vente restauration</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Repas</a>
                        <a class="dropdown-item" href="#">Boissons</a>
                        <a class="dropdown-item" href="#">Desserts et divers</a>
                        <a class="dropdown-item" href="#">Menu complet</a>
                    </div>
            </li>
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
                    aria-expanded="false">Gestion fiches clients</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Créer un compte</a>
                        <a class="dropdown-item" href="#">Chercher un compte</a>
                    </div>
            </li>
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
                    aria-expanded="false">Gestion des commandes</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Réception des commandes</a>
                        <a class="dropdown-item" href="#">Réception des nouveautées</a>
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
                            aria-expanded="false">Chercher une commande</a>
                            <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Librairie</a>
                                <a class="dropdown-item" href="#">Client</a>
                                <a class="dropdown-item" href="#">Toutes les commandes en cours</a>
                            </div>
                            
                    </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
                    aria-expanded="false">Consulter le stock</a>
                        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Par secteur</a>
                            <a class="dropdown-item" href="#">Dépôts</a>
                            
                        </div>
                            
            </li>
            

            <a href="#">Tableau de bord</a>
            <a href="#">Rechercher un titre</a>

        </div>    


        <span style="font-size:35px;cursor:pointer" onclick="openNav()">&#9776;
            <a class="navbar-brand" href="{{ url('/') }}">{{ config('app_name', 'MigouLib') }}</a>

        </span>
        
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "20%";
            }
            
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
            
        </script>


        <div id="app">  
            
            <div class="container">

                <main class="py-4">
                    @yield('content')
                </main>


                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    
                    <!-- Authentication Links -->
                    @guest
                        @if (Route::has('register'))         
                        @endif
                        @else

                        <li class="nav-item dropdown">
                            
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ Auth::user()->name }} <span class="caret"></span>

                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                                <a class="dropdown-item" href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}

                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf

                                </form>
                            </div>
                        </li>      
                    @endguest
                </div>
            </div>
        </div>
    </div>


</body>
</html>
