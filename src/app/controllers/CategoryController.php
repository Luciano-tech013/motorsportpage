<?php

declare(strict_types=1);

require_once __DIR__ . '/../../middlewares/AuthHelper.php';
require_once __DIR__ . '/../../middlewares/FlashErrorsHelper.php';

class CategoryController {

    private CategoryModel $categoryModel;
    private CarModel $carModel;
    private SiteView $siteView;
    private FormView $formView;
    private CategoryDeletionValidator $categoryDeletionValidator;
    private FormValidator $formValidator;
    private UniqueNameValidator $uniqueNameValidator;

    public function __construct(CategoryModel $categoryModel, CarModel $carModel, SiteView $siteView, FormView $formView, CategoryDeletionValidator $categoryDeletionValidator, FormValidator $formValidator, UniqueNameValidator $uniqueNameValidator){
        $this->categoryModel = $categoryModel;
        $this->carModel = $carModel;
        $this->siteView = $siteView;
        $this->formView = $formView;
        $this->categoryDeletionValidator = $categoryDeletionValidator;
        $this->formValidator = $formValidator;
        $this->uniqueNameValidator = $uniqueNameValidator;
    }

    public function getCategoryDetail(string $id): void {
        $detail = AuthHelper::isLogged() ? $this->categoryModel->getByIdAndUserIdWithDescription($id, AuthHelper::getUserId()) : $this->categoryModel->getByIdWithDescription($id);
        if(empty($detail)) {
            header("Location: " . BASE_URL);
            return;
        }

        $this->siteView->showDetail($detail, "Detalle de la categoria: ");
    }

    public function getFilterListOfCategory(string $id): void {
        $categoryName = null;
        
        //Si no está logueado, me traigo la categoria por defecto precargada
        if(AuthHelper::isLogged()) {
            $categoryName = $this->categoryModel->getByIdAndUserIdWithName($id, AuthHelper::getUserId());
        } else {
            $categoryName = $this->categoryModel->getByIdWithName($id);
        }

        //Si no hay nombre
        if(empty($categoryName)){
            header("Location: " . BASE_URL);
            return;
        }

        $cars = $this->carModel->getAllByCategoryIdWithNameAndBrand($id);
        
        $this->siteView->showCategoryFilterList($categoryName, $cars);
    }

    public function addCategory(): void {
        AuthHelper::checkLoggedAndRedict();
        
        //Me devuelve vacío si no existen los campos
        $fields = $this->getFields();
        if (empty($fields)) {
            header("Location: " . BASE_URL);
            return;
        }

        $errors = $this->formValidator->validateFields($fields);
        if(!empty($errors)) {
            FlashErrorsHelper::mapFieldErrors($errors);
            header("Location: " . $_SERVER['HTTP_REFERER']);
            return;
        }

        FlashErrorsHelper::clearErrors();

        $name = $_POST['name'];
        $nameId = strtolower($name);
        $userId = AuthHelper::getUserId();

        $isUnique = $this->uniqueNameValidator->isAUniqueName($this->categoryModel, $nameId, $userId);
        if(!$isUnique) {
            FlashErrorsHelper::addError("UNIQUE_NAME_CATEGORY", "El nombre de la categoria ya existe.");
            header("Location: " . $_SERVER['HTTP_REFERER']);
            return;
        }

        $this->categoryModel->addWithUserId(
            $name, 
            $nameId, 
            $fields["categoryDescription"], 
            $fields["type"],
            $userId
        );

        header("Location: " . BASE_URL);
    }

    public function deleteCategory(string $id): void {
        AuthHelper::checkLoggedAndRedict();

        //Validar si esa categoria existe para ese usuario
        if(!$this->categoryModel->getByIdAndUserId($id, AuthHelper::getUserId())) {
            header("Location: " . BASE_URL);
            return;
        }
        
        /*//Si no se envio el formulario, accion restrict
        if(!isset($_POST['cascade_delete'])) {
            try {
                $this->categoryDeletionValidator->isDeletable($id);
            } catch(CategoryDeletionException $e) {
                FlashErrorsHelper::addError("INVALID_CATEGORY_DELETABLE", $e->getMessage());
                FlashErrorsHelper::addError("INVALID_CATEGORY_DELETABLE_DATA", $e->getData());
                //Para poder enviarlo en el modal
                $_SESSION['CATEGORY']['ID_DELETABLE'] = $id;
                header("Location: " . BASE_URL);
                return;
            }
        }

        //Si se envio el formulario, pero el valor se modificó por un tercero
        if(!$_POST['cascade_delete'])
            return;

        //Si se envio el formulario de aceptacion, elimino en cascada
        FlashErrorsHelper::clearErrors();
        unset($_SESSION['CATEGORY']['ID_DELETABLE']);*/
    
        $this->categoryModel->deleteByIdAndUserId($id, AuthHelper::getUserId());
        
        header("Location: " . BASE_URL);
    }

    public function getCategoryForm(string $id): void {
        AuthHelper::checkLoggedAndRedict();

        $category = $this->categoryModel->getById($id);
        if(empty($category)) {
            header("Location: " . BASE_URL);
            return;
        }

        $route = "update/category/" . $id;

        $this->formView->showCategoryFormEdit('category.form.tpl', $category, $route);
    }

    public function updateCategory(string $id): void {
        AuthHelper::checkLoggedAndRedict();

        //Me devuelve vacío si no existen los campos
        $fields = $this->getFields();
        if(empty($fields)) {
            header("Location: " . BASE_URL);
            return;
        }

        $errors = $this->formValidator->validateFields($fields);
        if(!empty($errors)) {
            FlashErrorsHelper::mapFieldErrors($errors);
            header("Location: " . $_SERVER['HTTP_REFERER']);
            return;
        }

        FlashErrorsHelper::clearErrors();
    
        $this->categoryModel->update(
            $id, 
            $fields["categoryName"],
            strtolower($fields["categoryName"]), 
            $fields["categoryDescription"], 
            $fields["type"]
        );

        header("Location: " . BASE_URL);
    }

    private function getFields(): array {
        if(!isset($_POST["name"]) || !isset($_POST["description"]) || !isset($_POST["type"])) {
            return [];
        }

        return [
            "categoryName" => $_POST["name"],
            "categoryDescription" => $_POST["description"],
            "type" => $_POST["type"]
        ];
    }
}