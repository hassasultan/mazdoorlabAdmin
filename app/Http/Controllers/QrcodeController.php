<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class QrcodeController extends Controller
{
    public function index(){
        return view('view_qr_code');
    }
}