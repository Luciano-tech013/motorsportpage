<?php
/* Smarty version 4.2.1, created on 2024-11-29 18:30:15
  from 'F:\software development\xampp\htdocs\motorsportpage\app\Templates\form_categorias.edit.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.1',
  'unifunc' => 'content_6749fa27f13dc6_74536085',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '49ae2afb5831439bc0a3098c8302df56d23dc7ec' => 
    array (
      0 => 'F:\\software development\\xampp\\htdocs\\motorsportpage\\app\\Templates\\form_categorias.edit.tpl',
      1 => 1667921424,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:app/Templates/header.tpl' => 1,
  ),
),false)) {
function content_6749fa27f13dc6_74536085 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:app/Templates/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<section>
    <h1 class="text-center shadow-sm p-3 mb-0 bg-body rounded">Editar</h1>
    <div class="container">
        <div class="p-4 bg-light mt-3">
            <form class="g-3 mt-2" method="POST" action="updateCategorias/<?php echo $_smarty_tpl->tpl_vars['id']->value;?>
">
                <div class="mb-4">
                    <input type="text" class="form-control" name="nombre" value="<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['categorias']->value, 'categoria');
$_smarty_tpl->tpl_vars['categoria']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['categoria']->value) {
$_smarty_tpl->tpl_vars['categoria']->do_else = false;
echo $_smarty_tpl->tpl_vars['categoria']->value->nombre;
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>" placeholder="Nombre:">
                </div>
                <div class="mb-4">
                    <input type="text" class="form-control" value="<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['categorias']->value, 'categoria');
$_smarty_tpl->tpl_vars['categoria']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['categoria']->value) {
$_smarty_tpl->tpl_vars['categoria']->do_else = false;
echo $_smarty_tpl->tpl_vars['categoria']->value->descripcion;
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>" name="descripcion" placeholder="Descripcion:"></input>
                </div>
                <div class="mb-4">
                    <input type="text" class="form-control" name="tipo" value="<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['categorias']->value, 'categoria');
$_smarty_tpl->tpl_vars['categoria']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['categoria']->value) {
$_smarty_tpl->tpl_vars['categoria']->do_else = false;
echo $_smarty_tpl->tpl_vars['categoria']->value->tipo;
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>" placeholder="tipo:">
                </div>

                <button class="btn btn-badge text-bg-success">ENVIAR</button>
                <button class="btn btn-primary">VOLVER</button>
            </form>
        </div>
    </div>
</section><?php }
}
