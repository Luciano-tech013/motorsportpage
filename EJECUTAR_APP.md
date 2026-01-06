# 🚀 Ejecutar la Aplicación MotorSportPage

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- **Docker** (versión 20.10 o superior)
- **Docker Compose** (versión 2.0 o superior)

Para verificar que están instalados correctamente, ejecuta:

```bash
docker --version
docker compose version
```

## 🛠️ Configuración Inicial
1. **Clonar o descargar el repositorio** (si aún no lo has hecho)
2. **Verificar `.env`** en la raíz del proyecto, verificá la existencia del archivo .env con las siguientes variables:

```env
MYSQLPASSWORD=tu_password_mysql
MYSQLDATABASE=nombre_base_datos
MYSQLPORT=3306
APP_PORT=8080
```

## ▶️ Ejecutar la Aplicación
### Primera Ejecución (Construir y Levantar)
Para construir las imágenes y levantar los servicios por primera vez:
```bash
docker compose up --build
```
Este comando:
- Construye la imagen de la aplicación desde el Dockerfile
- Crea y levanta los contenedores (base de datos y aplicación web)
- Muestra los logs en tiempo real

### Ejecuciones Posteriores
Una vez construida la imagen, simplemente ejecuta:

```bash
docker compose up
```

Para ejecutar en segundo plano (detached mode):
```bash
docker compose up -d
```

## 📝 Comandos Útiles
### Ver los Logs
```bash
# Ver logs de todos los servicios
docker compose logs -f

# Ver logs solo del servicio web
docker compose logs -f web

# Ver logs solo de la base de datos
docker compose logs -f db
```

### Detener los Servicios
```bash
# Detener los servicios (mantiene los contenedores)
docker compose stop

# Detener y eliminar los contenedores
docker compose down
```
### Reconstruir la Aplicación

Si realizas cambios en el Dockerfile o necesitas una reconstrucción completa:

```bash
# Reconstruir sin usar caché
docker compose build --no-cache

# Reconstruir y levantar
docker compose up --build
```

### Acceder a los Contenedores

```bash
# Acceder al contenedor de la aplicación
docker compose exec web bash

# Acceder al contenedor de la base de datos
docker compose exec db mysql -u root -p
```

## 🔄 Desarrollo con Hot Reload

La aplicación está configurada para reflejar cambios automáticamente sin necesidad de reconstruir la imagen:

- ✅ Los cambios en `./src/` se reflejan automáticamente
- ✅ Los cambios en `./public/` se reflejan automáticamente
- ✅ Los cambios en `./src/vendor/` se reflejan automáticamente

**Nota:** Solo necesitarás reconstruir la imagen si:
- Modificas el `Dockerfile`
- Instalas nuevas dependencias del sistema
- Cambias la configuración de Apache

## 🌐 Acceder a la Aplicación
Una vez que los servicios estén corriendo, puedes acceder a la aplicación en:

```
http://localhost:{APP_PORT}
```

Donde `{APP_PORT}` es el valor configurado en tu archivo `.env` (por defecto: `8080`)

## ⚠️ Solución de Problemas

### El puerto ya está en uso

Si recibes un error de puerto en uso, puedes:
1. Cambiar el puerto en el archivo `.env`
2. Detener el servicio que está usando ese puerto

### La base de datos no se inicializa

Si la base de datos no se inicializa correctamente:
1. Elimina los volúmenes: `docker compose down -v`
2. Vuelve a levantar: `docker compose up --build`

### Los cambios no se reflejan

Asegúrate de que los volúmenes estén montados correctamente en el `docker-compose.yml` y que los archivos estén guardados en tu sistema local.

## 📚 Recursos Adicionales

- [Documentación de Docker Compose](https://docs.docker.com/compose/)
- [Documentación de Docker](https://docs.docker.com/)