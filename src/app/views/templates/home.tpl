{include file="layout/header.tpl"}

{if !isset($smarty.session.AUTH.IS_LOGGED)}
    {include file="init.tpl"}
{/if}

<section>
    <h1 class="text-center shadow-sm p-3 mb-4 mt-5 bg-body rounded">Lista de Autos</h1>
    {if !isset($smarty.session.AUTH.IS_LOGGED)}
        <p class="section-description fs-5">Aqui mostraremos informacion sobre algunos ejemplos de autos que pertenecen a algunas de estas
            categorias. En cada auto vamos a mostrar: Su nombre correspondiente (u apodos), breve descripcion del modelo, el
            nombre del modelo y la marca del fabricante y proveedor.</p>
    {/if}
    <div class="table-responsive-wrapper">
    <table class="table text-center">
        <thead>
            <tr class="bg-dark text-white">
                <th>Nombre</th>
                <th>Modelo</th>
                <th>Marca</th>
                <th>Categoria</th>
                <th>Detalle</th>
                {if isset($smarty.session.AUTH.IS_LOGGED)}
                    <th>BORRAR</th>
                    <th>EDITAR</th>
                {/if}
            </tr>
        </thead>
        <tbody>
            {foreach from=$cars item=$car}
                <tr class="fs-5">
                    <td data-label="Nombre">{$car->name}</td>
                    <td data-label="Modelo">{$car->model}</td>
                    <td data-label="Marca">{$car->brand}</td>
                    <td data-label="Categoria">{$car->category_name}</td>
                    <td data-label="Detalle"><a class="btn btn-primary" href="car/detail/{$car->car_id}">Detalle</a></td>
                    {if isset($smarty.session.AUTH.IS_LOGGED)}
                        <td data-label="Borrar">
                            <button 
                                class="btn btn-badge text-bg-danger btn-sm delete-btn"
                                data-bs-toggle="modal"
                                data-bs-target="#confirmDeleteModal"
                                data-entity-name="{$car->name}"
                                data-delete-url="remove/car/{$car->car_id}"
                                data-show-cascade="false"
                                type="button"
                            >
                                BORRAR
                            </button>
                        </td>
                        <td data-label="Editar"><a class="btn btn-badge text-bg-warning btn-sm" href="edit/car/{$car->car_id}">EDITAR</a></td>
                    {/if}
                </tr>
            {/foreach}
        </tbody>
    </table>
    </div>
</section>

<!--Pongo el valor en null porque no quiero que car.form cuando sea 
incluido desde aca utilize la variable $car, ya que aca se incluye 
para agregar no para editar. Entonces, en vez de asignarsela desde la vista
se la asigno desde acá con valor null. Por eso en car.form.tpl se valida que no se null
para mostrar los datos en el formulario. Lo mismo con $optionsCategory-->
{if isset($smarty.session.AUTH.IS_LOGGED)}
    {include file="forms/car.form.tpl" is_embedded=true current_year=$smarty.now|date_format:"%Y" car=null categories=$categories action="save/car" errors=$errors}
{/if}

<section>
    <h1 class="text-center shadow-sm p-3 mb-4 mt-5 bg-body rounded">Categorias a las que pertenecen</h1>
    {if !isset($smarty.session.AUTH.IS_LOGGED)}
        <p class="section-description fs-5">En esta tabla mostraremos los autos descriptos en la tabla anterior y la categoria competitiva a
            la que pertenecen. Mostraremos el nombre de la categoria, una detallada descripcion de su organizacion y objetivo, y en que parte del mundo rige.</p>
    {/if}
    <div class="table-responsive-wrapper">
    <table class="table text-center">
        <thead>
            <tr class="bg-dark text-white">
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Filtrar</th>
                <th>Detalle</th>
                {if isset($smarty.session.AUTH.IS_LOGGED)}
                    <th>BORRAR</th>
                    <th>EDITAR</th>
                {/if}
            </tr>
        </thead>
        <tbody>
            {foreach from=$categories item=$category}
                <tr class="fs-5">
                    <td data-label="Nombre">{$category->name}</td>
                    <td data-label="Tipo">{$category->type}</td>
                    <td data-label="Filtrar"><a class="btn btn-primary" href="category/cars/{$category->category_id}">Filtrar</a></td>
                    <td data-label="Detalle"><a class="btn btn-primary" href="category/detail/{$category->category_id}">Detalle</a></td>
                    {if isset($smarty.session.AUTH.IS_LOGGED)}
                        <td data-label="Borrar">
                           <!-- El botón llama a una función JavaScript para abrir el modal -->
                            <button 
                                class="btn btn-badge text-bg-danger btn-sm delete-btn"
                                data-bs-toggle="modal"
                                data-bs-target="#confirmDeleteModal"
                                data-entity-name="{$category->name}"
                                data-delete-url="remove/category/{$category->category_id}"
                                data-show-cascade="true"
                                type="button"
                            >
                                BORRAR
                            </button>
                        </td>
                        <td data-label="Editar"><a class="btn btn-badge text-bg-warning" href="edit/category/{$category->category_id}">EDITAR</a></td>
                    {/if}
                </tr>
            {/foreach}
        </tbody>
    </table>
    </div>
</section>
<!--Pongo el valor en null porque no quiero que category.form cuando sea 
incluido desde aca utilize la variable $categories, ya que aca se incluye 
para agregar no para editar-->
{if isset($smarty.session.AUTH.IS_LOGGED)}
    {include file="forms/category.form.tpl" is_embedded=true category=null action="save/category" errors=$errors}
{/if}

{include file="modals/confirm.remove.modal.tpl" errors=$errors}

{include file="layout/footer.tpl"}


