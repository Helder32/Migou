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
            <a href="#">Vente librairie</a>
            <a href="#">Vente restauration</a>
            <a href="#">Gestion fiches clients</a>
            <a href="#">Gestion commande</a>
            <a href="#">Rechercher un titre</a>
            <a href="#">Stock</a>
            <a href="#">Dépôt</a>
            <a href="#">Tableau de bord</a>

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

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>

                </button>

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
        <main class="py-4">
            @yield('content')
        </main>

</body>
</html>
