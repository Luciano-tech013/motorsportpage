{include file="layout/header.tpl"}

<section>
    <h1 class="text-center shadow-sm p-3 mb-0 bg-body rounded">{$tittle}</h1>
    <section class="section__car__detail">
        <div class="section__car__detail__description">
            <p class="section-description">{$object->description}</p>
        </div>
        <a class="btn btn-primary m-4" href=''>Volver</a>
    </section>
</section>

{include file="layout/footer.tpl"}