{include file='layout/header.tpl'}

<section>
    <h1 class="text-center shadow-sm p-3 mb-0 bg-body rounded">Eliminar Cuenta</h1>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
                <div class="p-4 bg-dark mt-3">
                    <div class="alert alert-danger mb-4">
                        <h5 class="mb-2">
                            <i class="bi bi-exclamation-triangle-fill"></i>
                            ¡ADVERTENCIA!
                        </h5>
                        <p class="mb-0 small">
                            Esta acción es <strong>IRREVERSIBLE</strong>. Al eliminar tu cuenta se borrarán todos tus datos permanentemente y no podrás recuperarlos.
                        </p>
                    </div>

                    <form class="g-3 mt-2" method="POST" action="remove/account/{$smarty.session.AUTH.USER_ID}">
                        <div class="mb-4">
                            <label for="password_delete" class="form-label text-white fs-4 fs-md-5">CONFIRMA TU CONTRASEÑA</label>
                            <input 
                                type="password" 
                                class="form-control form-control-md" 
                                name="password_delete" 
                                placeholder="Ingresa tu contraseña actual:" 
                                required>
                            {if isset($errors.INVALID_PASSWORD)}
                                <p class="text-danger small mt-2">{$errors.INVALID_PASSWORD}</p>
                            {/if}
                        </div>

                        <div class="mb-4">
                            <div class="form-check">
                                <input 
                                    type="checkbox" 
                                    class="form-check-input" 
                                    name="confirmation_delete" 
                                    required>
                                <label class="form-check-label text-white" for="confirmation_delete">
                                    Entiendo que esta acción no se puede deshacer
                                </label>
                            </div>
                            {if isset($errors.CONDITION_DELETE)}
                                <p class="text-danger small mt-1">{$errors.confirmation}</p>
                            {/if}
                        </div>

                        <div class="d-flex gap-2 justify-content-end">
                            <a href="home" class="btn btn-secondary btn-md">CANCELAR</a>
                            <button type="submit" class="btn btn-danger btn-md">ELIMINAR CUENTA</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </div>
</section>