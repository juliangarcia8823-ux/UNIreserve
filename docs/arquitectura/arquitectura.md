# ARQUITECTURA DE LA APLICACIÓN – UNIRESERVE

## 1. Introducción

UniReserve es una aplicación desarrollada para facilitar la consulta y reserva de espacios disponibles dentro de la universidad.

La aplicación está construida utilizando Flutter para la aplicación móvil, Spring Boot para el backend y PostgreSQL para el almacenamiento de la información.

La comunicación entre la aplicación móvil y la base de datos se realiza mediante el backend, utilizando servicios HTTP y datos en formato JSON.

---

## 2. Arquitectura general

La arquitectura de UniReserve está organizada en tres componentes principales:

* **Aplicación móvil:** desarrollada en Flutter.
* **Backend:** desarrollado con Spring Boot.
* **Base de datos:** PostgreSQL.

El flujo principal de comunicación es:

```text
Aplicación Flutter
       ↓
   HTTP / JSON
       ↓
Backend Spring Boot
       ↓
      JDBC
       ↓
PostgreSQL
```

La aplicación Flutter no se conecta directamente con PostgreSQL. Todas las solicitudes relacionadas con los datos pasan primero por el backend.

---

## 3. Aplicación móvil – Flutter

La aplicación móvil constituye la interfaz utilizada por el estudiante.

Entre las funcionalidades implementadas se encuentran:

* Consultar espacios disponibles.
* Ver información de un espacio.
* Realizar una reserva.
* Consultar las reservas realizadas.
* Cancelar una reserva.
* Visualizar la confirmación de una reserva.

La aplicación utiliza servicios HTTP para comunicarse con el backend.

La dirección utilizada durante las pruebas en el emulador Android es:

```text
http://10.0.2.2:8080/api
```

---

## 4. Backend – Spring Boot

El backend funciona como intermediario entre la aplicación móvil y la base de datos.

Su función principal es recibir las solicitudes realizadas desde Flutter, procesarlas y comunicarse con PostgreSQL para consultar o almacenar la información.

Entre los endpoints implementados se encuentran:

```text
GET    /api/spaces
GET    /api/spaces/{id}
GET    /api/spaces/available
POST   /api/reservations
GET    /api/reservations/mine
DELETE /api/reservations/{id}
```

El backend se ejecuta en el puerto:

```text
8080
```

---

## 5. Base de datos – PostgreSQL

PostgreSQL es utilizado para almacenar la información necesaria para el funcionamiento de la aplicación.

La base de datos se ejecuta mediante Docker y utiliza el puerto:

```text
5432
```

El backend se conecta a PostgreSQL mediante JDBC.

Esta separación permite que la aplicación móvil no tenga acceso directo a la base de datos y que las operaciones sobre los datos sean gestionadas por el backend.

---

## 6. Docker

Docker se utiliza para ejecutar los servicios del backend y la base de datos de manera independiente.

Los principales contenedores utilizados son:

```text
unireserve-backend
unireserve-postgres
```

El backend se encuentra disponible en:

```text
localhost:8080
```

PostgreSQL se encuentra disponible en:

```text
localhost:5432
```

---

## 7. Estructura de comunicación

El proceso general de una consulta funciona de la siguiente manera:

1. El estudiante utiliza la aplicación Flutter.
2. Flutter realiza una solicitud HTTP al backend.
3. Spring Boot recibe y procesa la solicitud.
4. El backend consulta o modifica la información en PostgreSQL.
5. PostgreSQL devuelve la información al backend.
6. Spring Boot responde a Flutter utilizando JSON.
7. Flutter muestra el resultado al estudiante.

---

## 8. Ventajas de la arquitectura

La arquitectura implementada permite separar las responsabilidades de cada componente.

**Flutter** se encarga de la interfaz y la interacción con el usuario.

**Spring Boot** se encarga de la lógica del sistema y de gestionar las solicitudes.

**PostgreSQL** se encarga del almacenamiento de los datos.

Esta separación facilita el mantenimiento, las pruebas y la evolución del sistema.

---

## 9. Arquitectura utilizada en el MVP

Para el primer MVP se utiliza la siguiente estructura:

```text
┌─────────────────────────┐
│     Aplicación Flutter  │
│       Android           │
└────────────┬────────────┘
             │
          HTTP/JSON
             │
             ▼
┌─────────────────────────┐
│      Spring Boot        │
│       Backend :8080     │
└────────────┬────────────┘
             │
            JDBC
             │
             ▼
┌─────────────────────────┐
│       PostgreSQL         │
│          :5432           │
└─────────────────────────┘
```

Esta es la arquitectura actualmente implementada para UniReserve.

