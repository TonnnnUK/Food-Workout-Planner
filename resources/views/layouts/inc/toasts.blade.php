@if ( (session()->has('success')) )

  <toast-alert message="{{session()->get('success')}}"></toast-alert>

@endif