<?php

declare(strict_types=1);

require_once __DIR__ . '/../../middlewares/AuthHelper.php';

class UserController {

    private UserModel $userModel;
    private FormView $formView;
    private FormValidator $formValidator;
    private UniqueNameValidator $uniqueNameValidator;

    public function __construct(UserModel $userModel, FormView $formView, FormValidator $formValidator, UniqueNameValidator $uniqueNameValidator){
        $this->userModel = $userModel;
        $this->formView = $formView;
        $this->formValidator = $formValidator;
        $this->uniqueNameValidator = $uniqueNameValidator;
    }

    public function getSignUpForm(): void {
        $this->formView->showFormUser('signup.form.tpl');
    }

    public function getSignInForm(): void {
        $this->formView->showFormUser('signin.form.tpl');
    }

    public function createUser(): void {
        $fields = $this->getFields();
        if(empty($fields)) {
            header("Location: " . BASE_URL);
            return;
        }

        $errors = $this->formValidator->validateFields($fields);
        if(!empty($errors)) {
            FlashErrorsHelper::mapFieldErrors($errors);
            header("Location: " . BASE_URL . "account");
            return;
        }
        
        FlashErrorsHelper::clearErrors();
       
        $username = $_POST['username'];
        $nameId = strtolower($username);
        $userId = AuthHelper::getUserId();
        
        $isUnique = $this->uniqueNameValidator->isAUniqueName($this->userModel, $nameId, $userId);
        if(!$isUnique) {
            FlashErrorsHelper::addError("UNIQUE_NAME_USER", "Ya existe un usuario con ese nombre en el sistema. Por favor, elije otro");
            header("Location: " . BASE_URL . "account");
            return;
        }
        
        //Hasheo la contraseña
        $userpassword = password_hash($_POST['password'], PASSWORD_BCRYPT);

        $id = $this->userModel->add($username, $userpassword, $nameId);

        $user = $this->userModel->getById($id);

        AuthHelper::initSession($user);

        header("Location: " . BASE_URL);
    }

    public function getRemoveAccountForm(): void {
        $this->formView->showFormUser('remove.account.form.tpl');
    }

    public function removeUser(string $id): void {
        AuthHelper::checkLoggedAndRedict();

        FlashErrorsHelper::clearErrors();

        //evito llamadas desde otro lugar
        if(!isset($_POST['password_delete']) || !isset($_POST['confirmation_delete'])) {
            header("Location: " . BASE_URL);
            return;
        }
        
        //buscar datos del usuario (contraseña) y validar que el usuario exista
        $user = $this->userModel->getById($id);
        if(!$user) {
            header("Location: " . BASE_URL);
            return;
        } 

        //Validar contraseña
        if(!password_verify($_POST['password_delete'], $user->password)) {
            FlashErrorsHelper::addError("INVALID_PASSWORD", "La contraseña es incorrecta. La cuenta no se eliminó.");
            header("Location: " . BASE_URL . "remove/account/form/");
            return;
        }

        //Valido que haya aceptado la condicion de eliminacion de cuenta
        if(empty($_POST["confirmation_delete"])) {
            FlashErrorsHelper::addError("CONDITION_DELETE", "Debe aceptar la responsabilidad de eliminar la cuenta");
            header("Location: " . $_SERVER["HTTP_REFERER"]);
            return;
        }

        $this->userModel->delete($id);

        AuthHelper::destroyLogin();

        header("Location: " . BASE_URL);
    }

    private function getFields(): array {
        //Valido que los datos hayan venido del envío del formulario
        if(!isset($_POST["username"]) || !isset($_POST["password"]) || !isset($_POST["politicies"]))
            return [];
    
        return [
            "username" => $_POST["username"],
            "password" => $_POST["password"],
            "politicies" => $_POST["politicies"]
        ];
    }
}
