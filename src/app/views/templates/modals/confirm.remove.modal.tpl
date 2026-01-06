<!-- Modal genérico de confirmación de eliminación -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <!-- Ícono de advertencia -->
                <div class="mb-3">
                    <i class="bi bi-exclamation-triangle-fill text-warning" style="font-size: 4rem;"></i>
                </div>
                
                <!-- Mensaje dinámico que cambia según el contexto -->
                <p class="fs-5 mb-2">¿Estás seguro de que deseas eliminar?</p>
                <p class="fs-4 fw-bold text-danger" id="entityNameText"></p>
                
                <!-- Advertencia adicional para categorias -->
                <div class="alert alert-warning mt-3" id="cascadeWarning" style="display: none;">
                    <small><strong>Advertencia:</strong> Esta acción eliminará todos los autos asociados a ella.</small>
                </div>

                <p class="text-muted mt-3">Esta acción no se puede deshacer.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar Operación</button>
                <!-- El enlace se actualiza dinámicamente -->
                <a href="#" class="btn btn-danger" id="confirmDeleteLink">
                    <i class="bi bi-trash"></i> Eliminar
                </a>
            </div>
        </div>
    </div>
</div>