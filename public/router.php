<?php
require_once __DIR__ . '/../../src/app/Instances.php';
require_once __DIR__ . '/../../src/libs/Router.php';
//require_once __DIR__ . '/../../vendor/autoload.php'; --> No lo voy a utilizar por ahora

//obtengo el protocolo de la solicitud (HTTPS si estoy en Render)
$scheme = $_SERVER['HTTP_X_FORWARDED_PROTO'] ?? 'http';
$host = $_SERVER['HTTP_HOST'];  //incluye dominio y, si existiera, puerto
//punto de entrada
$path = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/');

define('BASE_URL', "{$scheme}://{$host}{$path}/");

//Como el servidor no mantiene estado, ésta es una única instancia en una sola ejecución por request
$instances = new Instances();

session_start();

Router::setDefaultRoute($instances->getSiteController(), 'createHome');

Router::addRoute('politicies', $instances->getSiteController(), 'getPrivacityPolicy');

Router::addRoute('politicies', $instances->getSiteController(), 'getPrivacityPolicy');

Router::addRoute('contact', $instances->getSiteController(), 'getContact');

Router::addRoute('signup', $instances->getUserController(), 'createUser');

Router::addRoute('account', $instances->getUserController(), 'getSignUpForm');

Router::addRoute('account/validate', $instances->getUserController(), 'getSignInForm');

Router::addRoute('login', $instances->getAuthController(), 'login');

Router::addRoute('account/logout', $instances->getAuthController(), 'logout');

Router::addRoute('remove/account/form/', $instances->getUserController(), 'getRemoveAccountForm');

Router::addRoute('remove/account/', $instances->getUserController(), 'removeUser');

Router::addRoute('car/detail',  $instances->getCarController(), 'getCarDetail');

Router::addRoute('save/car',  $instances->getCarController(), 'addCar');

Router::addRoute('remove/car/',  $instances->getCarController(), 'deleteCar');

Router::addRoute('edit/car/',  $instances->getCarController(), 'getCarForm');

Router::addRoute('update/car/',  $instances->getCarController(), 'updateCar');

Router::addRoute('save/category', $instances->getCategoryController(), 'addCategory');

Router::addRoute('category/detail', $instances->getCategoryController(), 'getCategoryDetail');

Router::addRoute('remove/category', $instances->getCategoryController(), 'deleteCategory');

Router::addRoute('edit/category', $instances->getCategoryController(), 'getCategoryForm');

Router::addRoute('update/category', $instances->getCategoryController(), 'updateCategory');

Router::addRoute('category/cars', $instances->getCategoryController(), 'getFilterListOfCategory');

//Capturo la accion
$action = $_GET['action'] ?? 'home';

//Ejecuto router
Router::route($action);


