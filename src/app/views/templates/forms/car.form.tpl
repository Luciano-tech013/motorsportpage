<!--Incluyo de nuevo el header para cargar los estilos si es que este archivo se llama para editar--->
{if !isset($is_embedded) || !$is_embedded}
    {include file="layout/header.tpl"}
{/if}

<section class="section__car__form">
    <h1 class="text-center shadow-sm p-3 mb-0 bg-body rounded">Formulario para Autos</h1>
    <div class="container">
        <div class="p-4 bg-light mt-3">
            <form class="row g-3 mt-2" method="POST" id="car_form" {if isset($action)} action="{$action}" {/if}>
                <div class="col-12 col-md-6">
                    <input type="text" {if !empty($car)} class="form-control is-valid" {else} class="form-control" {/if}  id="car_name" name="name" {if !empty($car)} value="{$car->name}" {/if} placeholder="Nombre:" required>
                    {if isset($errors.carName)}
                        <p class="text-danger">{$errors.carName}</p>
                    {/if}
                    {if isset($errors.UNIQUE_NAME_CAR)}
                        <p class="text-danger">{$errors.UNIQUE_NAME_CAR}</p>
                    {/if}
                </div>

                <div class="col-12 col-md-6">
                    <input type="text" {if !empty($car)} class="form-control is-valid" {else} class="form-control" {/if} id="brand" name="brand" {if !empty($car)}
                        value="{$car->brand}" {/if} placeholder="Marca:" required>
                    {if isset($errors.brand)}
                        <p class="text-danger">{$errors.brand}</p>
                    {/if}
                </div>

                <div class="col-12 mt-4">
                    <textarea {if !empty($car)} class="form-control is-valid" {else} class="form-control" {/if} id="car_description" name="description" placeholder="Descripción:"
                        required>{if !empty($car)}{$car->description}{/if}</textarea>
                    {if isset($errors.carDescription)}
                        <p class="text-danger">{$errors.carDescription}</p>
                    {/if}
                </div>

                <div class="col-12 col-md-6 mt-4">
                    <select class="form-select" id="model" name="model" required>
                        {if !isset($car)}
                            <option value="" disabled selected>Seleccione un año de modelo</option>
                            {section name=year start=0 loop=$current_year-1900+1 step=1}
                                {assign var="year_value" value=$current_year-$smarty.section.year.index}
                                <option value="{$year_value}">{$year_value}</option>
                            {/section}
                        {/if}

                        {if isset($car) && !empty($car)}
                            {section name=year start=0 loop=$current_year-1900+1 step=1}
                                {assign var="year_value" value=$current_year-$smarty.section.year.index}
                                <option value="{$year_value}" {if $car->model == $year_value} selected {/if}>
                                    {$year_value}</option>
                            {/section}
                        {/if}
                    </select>
                    {if isset($errors.model)}
                        <p class="text-danger">{$errors.model}</p>
                    {/if}
                </div>

                <div class="col-12 col-md-6 mt-4">
                    <select class="form-select" id="category_id" name="category_id" required>
                        {if !isset($car)}
                            <option value="" disabled selected>Seleccione un tipo de categoría</option>
                            {foreach from=$categories item=$category}
                                <option value="{$category->category_id}">{$category->name}</option>
                            {/foreach}
                        {/if}

                        {if isset($car) && !empty($car)}
                            {foreach from=$categories item=$category}
                                <option value="{$category->category_id}" {if $car->category_id == $category->category_id}
                                    selected {/if}>{$category->name}</option>
                            {/foreach}
                        {/if}
                    </select>
                    {if isset($errors.category_id)}
                        <p class="text-danger">{$errors.repeatedCar}</p>
                    {/if}
                </div>
                
                <div class="col-12">
                    {if isset($categories) && !empty($categories)}
                        <button class="btn btn-badge text-bg-success me-2" type="submit">ENVIAR</button>
                    {/if}
                    {if isset($car) && !empty($car)}
                        <a class="btn btn-primary" href="">VOLVER</a>
                    {/if}
                    {if isset($categories) && empty($categories)}
                        <p class="text-danger">Para agregar un auto primero debes crear una categoria</p>
                    {/if}
                </div>
            </form>
        </div>
    </div>
</section>

