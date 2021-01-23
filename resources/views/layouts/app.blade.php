@include('layouts.inc.html_start')
<body class="bg-gray-100">
    
    <div id="app">
            
        <site-header @auth loggedin="true" 
                    :user="{{ json_encode( Auth::user()) }}" 
                    :role="{{ json_encode( Auth::user()->role()) }}" @endauth 
            @guest loggedin="false" user="null" @endguest>
        </site-header>
        
        <main id="main-content">
            @yield('content')
        </main>
        
        @include('layouts.inc.toasts')

        @livewire('site-footer')
        <site-footer></site-footer>
        
    </div>

    @livewireScripts
    @yield('custom-script')

</body>
</html>
