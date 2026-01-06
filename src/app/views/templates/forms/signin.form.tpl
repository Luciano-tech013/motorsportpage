{include file='layout/header.tpl'}

<section>
    <h1 class="text-center shadow-sm p-3 mb-0 bg-body rounded">Accede a tu Cuenta</h1>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
                <div class="p-4 bg-dark mt-3" id="signinForm">
                    <form class="g-3 mt-2" method="POST" action="login">
                        <div class="mb-4">
                            <label for="nombre" class="form-label text-white fs-4 fs-md-5">NOMBRE</label>
                            <input type="text" class="form-control form-control-md" name="username" placeholder="Tu Nombre:" id="nombre" required>
                        </div>
                        <div class="mb-4">
                            <label for="password_signin" class="form-label text-white fs-4 fs-md-5">PASSWORD</label>
                            <input type="password" class="form-control form-control-md" id="password_signin" name="password" placeholder="Escribe tu contraseña:" required>
                        </div>
                        <div class="d-flex gap-2 justify-content-start">
                            <button type="submit" class="btn btn-success btn-md">LOGIN</button>
                        </div>
                        {if isset($errors.INVALID_USER)}
                            <p class="text-danger small mt-2">{$errors.INVALID_USER}</p>
                        {/if}
                        <p class="form-label text-white fs-5 fs-md-5 mt-5">
                            ¿No tenes cuenta?. <br> Registrate de forma gratuita en nuestro
                            sistema clickeando en el siguiente boton: <a class="btn btn-primary btn-md" href="account">REGISTRATE</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </div>
</section>
