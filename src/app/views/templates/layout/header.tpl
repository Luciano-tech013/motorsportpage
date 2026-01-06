<!DOCTYPE html>
<html lang="en">
<head>
    <base href="{BASE_URL}">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/footer.css">
    <link rel="stylesheet" href="/assets/css/sections.car.css">
    <link rel="stylesheet" href="/assets/css/contact.css">
    <link rel="stylesheet" href="/assets/css/privacity.policy.css">
    <link rel="stylesheet" href="/assets/css/users.forms.css">
    <link rel="stylesheet" href="/assets/css/home.css">
    <title>MotorSportPage</title>
</head>
<body>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <img width="98" class="navbar-brand" src="/assets/logo_page.jpg" alt="Logo de la Pagina">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavGuest" aria-controls="navbarNavGuest" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavGuest">
            <ul class="navbar-nav ms-auto" id="menu-nav">
                <li class="nav-item"><a class="nav-link custom-nav-link fs-5" href="">HOME</a></li>
                <li class="nav-item"><a class="nav-link custom-nav-link fs-5" href="politicies">POLÍTICA & PRIVACIDAD</a></li>
                <li class="nav-item"><a class="nav-link custom-nav-link fs-5" href="contact">CONTACTO</a></li>
                {if isset($smarty.session.AUTH.IS_LOGGED)}
                    <li class="nav-item"><a class="nav-link custom-nav-link fs-5" href="account/logout" data-bs-toggle="modal" data-bs-target="#confirmLogoutModal">CERRAR SESIÓN</a></li>
                    <li class="nav-item"><a class="nav-link custom-nav-link fs-5" href="remove/account/form/{$smarty.session.AUTH.USER_ID}">ELIMINAR CUENTA</a></li>
                {else}
                    <li class="nav-item"><a class="nav-link custom-nav-link fs-5" href="account/validate">INICIAR SESIÓN</a></li>
                {/if}
            </ul>
        </div>
    </div>
</nav>
</header>
<main>
    
{include file="../modals/logout.modal.tpl"}