<?php

class AuthHelper {
    
    function login($usuario){
        session_start();
        $_SESSION['ID_USUARIO'] = $usuario->id;
        $_SESSION['NOMBRE'] = $usuario->nombre;
        $_SESSION['PASSWORD'] = $usuario->password;
        $_SESSION['IS_LOGGED'] = true;
    }

    function destroyLogin(){
        session_start();
        session_destroy();
    }

    function checkLogged() {
        session_start();
        if (!isset($_SESSION['IS_LOGGED'])) {
            header("Location: " . BASE_URL . 'login');
            die();
        }
    }
}