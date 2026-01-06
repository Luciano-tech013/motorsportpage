{include file='layout/header.tpl'}

<section>
  <h1 class="text-center shadow-sm p-3 mb-0 bg-body rounded">Registrarse</h1>

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
        <div class="p-4 bg-dark mt-3" id="signupForm">
          <form class="g-3 mt-2" method="POST" id="signup_form" action="signup" autocomplete="on">
            <div class="mb-4">
              <label for="username" class="form-label text-white fs-4">NOMBRE</label>
              <input type="text" class="form-control" id="username" name="username" placeholder="Tu Nombre:" required>
              {if isset($errors.username)}<p class="text-danger small">{$errors.username}</p>{/if}
              {if isset($errors.UNIQUE_NAME_USER)}<p class="text-danger small">{$errors.UNIQUE_NAME_USER}</p>{/if}
            </div>

            <div class="mb-4">
              <label for="password_signup" class="form-label text-white fs-4">PASSWORD</label>
              <input type="password" class="form-control" id="password_signup" name="password" placeholder="Escribe tu contraseña:" required>
              {if isset($errors.password)}<p class="text-danger small">{$errors.password}</p>{/if}
            </div>

            <div class="mb-4 form-check">
              <input type="checkbox" name="politicies" id="politicies" class="form-check-input" required>
              <label for="politicies" class="form-check-label text-white">Aceptar Politica & Privacidad</label>
              {if isset($errors.politicies)}<p class="text-danger small">{$errors.politicies}</p>{/if}
            </div>

            <div class="d-flex gap-2 justify-content-start">
              <button type="submit" class="btn btn-success btn-md">REGISTRARSE</button>
              <a class="btn btn-primary btn-md" href="">VOLVER</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
