## ¿Por qué es mejor manejrar los errores con PRG y con redireccionar directo?
Cuando redireccionamos directo desde la vista, llamando al método que renderiza el template
estamos solicitando una nueva página con los errores. El problema surge si el usuario, por accidente o con intencion, refresca la página, estariamos realizando otra vez el POST y validando los datos de nuevo. En cambio, si flasheamos el error en una sesion, el navegador recibe un 302 por parte del servidor y redirecciona a la misma página con los errores. Si el usuario refresca, el navegador solicita de nuevo con un GET la página que contiene los errores y no realiza el POST nuevamente (salvo que aprete en el boton submit del formulario), lo cuál es mas óptimo y ademas, más "coherente" o "lógico" en el manejo de errores.

## Funcionamiento del Router creado por mí
El router solamente funciona para rutas que admitan un solo parámetro y sea del tipo Path Param. (Las query params en PHP se obtiene por $_GET). Para utilizar el router, se deben manejar 3 funciones básicas que tra el mismo:

- *addRoute* : Permite cargar una ruta y su accion consecuente. De la ruta solo es necesario cargar el path, no hace falta especificar si lleva parámetro o no. Si la ruta ya fue cargada previamente dentro dentro del mismo flujo de ejecución, no se agregará.
- *setDefaultRoute*: Permite cargar una ruta por defecto si ninguna ruta almacenada por el router coincide con la que se obtiene de la URL
- *route* : Permite ejecutar la ruta. Éste método inicializa una búsqueda para encontrar un match con la URL obtenida. En primer lugar, intenta hacer match directo. Si falla, es porque la URL tiene parámetro. Para eso, se procesa para obtenerlo y enviarlo al método run de la ruta para que sea pasado como argumento al controlador y completar la acción. Si aún así, no se encuentra un match, se ejecuta la ruta configurada por defecto. Si no hay ruta por defecto, el router simplemente no hará nada.

### En un futuro:
- Me gustaria refactorizar los modelos para evitar el uso de join cuando el usuario está logueado
y evitar repetir código. Por cuestiones de tiempo no lo puedo hacer ahora
- Mejorar la aplicacion de estilos CSS y Bootstrap
- Refactorizar router para explicitar ID

## ¿Por qué utilizo docker compose en el proyecto?
Lo utilizo para poder desplegar en desarrollo. Mi dockerfile de la web app fue detectado por Render, asi que no hay problemas con las rutas

### LINK A RENDER (Backend): https://dashboard.render.com/web/srv-d0d1ibp5pdvs73f45ab0/deploys/dep-d0d54jbuibrs73du5tr0?r=2025-05-06%4018%3A16%3A50%7E2025-05-06%4018%3A19%3A58
### LINK A CLEVER CLOUD (MySQL): https://console.clever-cloud.com/users/me/addons/addon_9d3c329d-00b6-42c1-b9fa-f5051066f99e/informations
