@extends('layouts.home')

@section('content')
<div class="container">
    <div class="row justify-content-center" style="margin-top:100px;">

        <h1><b>TELEFONSKI IMENIK</b></h1>
        @if (session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
    </div>
@endif

         <!--  <div class="col-md-8">
          
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
                </div>
            </div> 

        </div>-->
    </div>
    <div class="row justify-content-center" style="margin-top:50px;">
        @guest
            <a class="btn btn-outline-primary btn-lg" href="{{ route('login') }}" role="button" style="margin-right:30px;">{{ __('Uloguj se') }}</a>
            <a class="btn btn-outline-primary btn-lg" href="{{ route('register') }}" role="button">{{ __('Registracija') }}</a>
        @else
            <a class="btn btn-outline-primary btn-lg" href="{{ url('/welcome') }}" role="button" style="margin-right:30px;">{{ __('Imenik') }}</a>
            <a class="btn btn-outline-primary btn-lg" href="{{ route('logout') }}" role="button" 
                onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">{{ __('Izloguj se') }}</a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>

        @endguest
</div>
@endsection
