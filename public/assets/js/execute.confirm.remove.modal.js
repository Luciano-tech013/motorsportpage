/**
 * Éste código permite que un mismo modal se utilice para confirmar el borrado de un auto
 * o una categoría. Para eliminar una categoría se muestra la advertencia de la eliminacion en cascade
 * y se cambia dinámicamente el href del botón para matchear la route que elimina al elemento.
 */
document.addEventListener('DOMContentLoaded', function() {
    // Referencia del modal de Bootstrap
    const modal = document.getElementById('confirmDeleteModal');
    
    // Obtén referencias a los elementos del modal para actualizar
    const entityNameText = document.getElementById('entityNameText');
    const confirmDeleteLink = document.getElementById('confirmDeleteLink');
    const cascadeWarning = document.getElementById('cascadeWarning');
    
    modal.addEventListener('show.bs.modal', (event) => {
        const button = event.relatedTarget;
        if(!button) return;

        const entityName = button.dataset.entityName;
        const deleteUrl = button.dataset.deleteUrl;
        const showCascade = button.dataset.showCascade === "true";

        // Actualiza el contenido del modal con los datos específicos
        entityNameText.textContent = entityName;

        //ESTA SENTENCIA PERMITE EJECUTAR LA RUTA QUE ELIMINA AL ELEMENTO
        confirmDeleteLink.href = deleteUrl;

        // Muestra u oculta la advertencia de cascade según corresponda
        if (showCascade) {
            cascadeWarning.style.display = 'block';
        } else {
            cascadeWarning.style.display = 'none';
        }
    })
});
