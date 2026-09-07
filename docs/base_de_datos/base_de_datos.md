# BASE DE DATOS – UNIRESERVE

## 1. Introducción

UniReserve utiliza PostgreSQL como sistema de gestión de base de datos.

La base de datos permite almacenar y gestionar la información necesaria para el funcionamiento de la aplicación, principalmente los espacios disponibles y las reservas realizadas.

La conexión entre el backend y PostgreSQL se realiza mediante JDBC.

---

## 2. Sistema de gestión de base de datos

**Sistema:** PostgreSQL

**Versión utilizada:** PostgreSQL 17

**Puerto:** 5432

La base de datos se ejecuta mediante Docker, lo que permite tener el servicio aislado y facilitar su configuración durante el desarrollo.

---

## 3. Contenedor de PostgreSQL

El servicio de PostgreSQL se ejecuta en un contenedor Docker denominado:

```text
unireserve-postgres
```

El puerto utilizado es:

```text
5432
```

La comunicación con el backend se realiza desde Spring Boot mediante JDBC.

---

## 4. Información almacenada

La base de datos almacena la información relacionada con:

* Espacios disponibles.
* Información de los espacios.
* Reservas realizadas.
* Información necesaria para consultar y gestionar las reservas.

Los datos son utilizados por el backend para responder las solicitudes realizadas desde la aplicación Flutter.

---

## 5. Flujo de acceso a los datos

La aplicación no se conecta directamente a PostgreSQL.

El flujo utilizado es:

```text
Flutter
   ↓
HTTP / JSON
   ↓
Spring Boot
   ↓
JDBC
   ↓
PostgreSQL
```

De esta manera, Spring Boot funciona como intermediario entre la aplicación móvil y la base de datos.

---

## 6. Operaciones relacionadas con la base de datos

El backend implementa operaciones para consultar y gestionar la información del sistema.

Entre las operaciones disponibles se encuentran:

### Consulta de espacios

```text
GET /api/spaces
```

Permite obtener los espacios registrados.

### Consulta de un espacio

```text
GET /api/spaces/{id}
```

Permite obtener la información de un espacio específico.

### Consulta de espacios disponibles

```text
GET /api/spaces/available
```

Permite consultar los espacios disponibles según los parámetros enviados.

### Crear una reserva

```text
POST /api/reservations
```

Permite registrar una nueva reserva.

### Consultar mis reservas

```text
GET /api/reservations/mine
```

Permite consultar las reservas asociadas al usuario.

### Cancelar una reserva

```text
DELETE /api/reservations/{id}
```

Permite cancelar una reserva existente.

---

## 7. Importancia de PostgreSQL en el MVP

PostgreSQL es el componente encargado de mantener almacenada la información del sistema.

Su utilización permite que los datos permanezcan disponibles para las diferentes operaciones realizadas por el backend.

En el primer MVP, la base de datos proporciona el almacenamiento necesario para que UniReserve pueda consultar espacios y gestionar las reservas.

---

## 8. Arquitectura de datos

La arquitectura utilizada para el acceso a los datos es:

```text
┌─────────────────────────┐
│     Aplicación Flutter  │
└────────────┬────────────┘
             │
          HTTP/JSON
             │
             ▼
┌─────────────────────────┐
│      Spring Boot        │
│        Backend          │
└────────────┬────────────┘
             │
            JDBC
             │
             ▼
┌─────────────────────────┐
│       PostgreSQL 17     │
│          :5432          │
└─────────────────────────┘
```

Esta estructura permite separar la interfaz, la lógica del sistema y el almacenamiento de los datos.

---

## 9. Estado actual

La base de datos PostgreSQL se encuentra integrada con el backend de UniReserve y se ejecuta mediante Docker.

El backend puede consultar y gestionar la información necesaria para las funcionalidades implementadas en el primer MVP.

