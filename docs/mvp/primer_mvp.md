# PRIMER MVP – UNIRESERVE

## 1. Introducción

El primer Producto Mínimo Viable (MVP) de UniReserve corresponde a una aplicación móvil que permite consultar espacios universitarios y gestionar reservas de manera sencilla.

El MVP integra una aplicación desarrollada en Flutter, un backend desarrollado con Spring Boot y una base de datos PostgreSQL.

---

## 2. Objetivo del MVP

El objetivo principal del MVP es disponer de una primera versión funcional que permita al estudiante consultar los espacios disponibles y realizar las operaciones básicas relacionadas con las reservas.

Esta versión permite validar el funcionamiento de la arquitectura y de las funcionalidades principales del sistema.

---

## 3. Funcionalidades incluidas

El primer MVP incluye las siguientes funcionalidades:

### 3.1 Consultar espacios disponibles

El usuario puede consultar los espacios registrados en el sistema y visualizar información como:

* Nombre del espacio.
* Tipo de espacio.
* Capacidad.
* Disponibilidad.

### 3.2 Ver información de un espacio

El usuario puede seleccionar un espacio y consultar información adicional sobre sus características y descripción.

### 3.3 Realizar una reserva

El usuario puede realizar una reserva de un espacio mediante la aplicación.

La información de la reserva es enviada al backend y almacenada en la base de datos.

### 3.4 Consultar mis reservas

El usuario puede consultar las reservas que ha realizado mediante la aplicación.

### 3.5 Cancelar una reserva

El usuario puede seleccionar una reserva y realizar su cancelación.

### 3.6 Confirmación de reserva

Después de realizar una reserva, la aplicación permite visualizar una confirmación para verificar que el proceso se realizó correctamente.

---

## 4. Tecnologías utilizadas

El primer MVP está construido utilizando las siguientes tecnologías:

* **Flutter:** desarrollo de la aplicación móvil.
* **Dart:** lenguaje utilizado para Flutter.
* **Spring Boot:** desarrollo del backend.
* **Java:** lenguaje utilizado para el backend.
* **PostgreSQL:** sistema de gestión de base de datos.
* **Docker:** ejecución de los servicios del backend y la base de datos.
* **HTTP/JSON:** comunicación entre la aplicación móvil y el backend.
* **JDBC:** conexión entre el backend y PostgreSQL.

---

## 5. Arquitectura del MVP

La comunicación entre los componentes se realiza de la siguiente manera:

```text id="psm6r4"
┌─────────────────────────┐
│     Aplicación Flutter  │
│        Android          │
└────────────┬────────────┘
             │
          HTTP/JSON
             │
             ▼
┌─────────────────────────┐
│      Spring Boot        │
│      Backend :8080      │
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

La aplicación Flutter no tiene una conexión directa con PostgreSQL. El backend administra las solicitudes y el acceso a los datos.

---

## 6. Validación del MVP

Durante el desarrollo se realizaron pruebas de funcionamiento de las principales funcionalidades.

También se verificó la comunicación entre Flutter y el backend y la consulta de información desde PostgreSQL.

El proyecto fue analizado mediante Flutter y no se encontraron problemas de análisis:

```text
No issues found!
```

Además, se generó una versión APK de la aplicación para su ejecución en Android.

---

## 7. Estado actual del MVP

El primer MVP de UniReserve se encuentra funcional y cuenta con las principales características definidas en las historias de usuario.

La versión actual permite demostrar la integración entre la aplicación móvil, el backend y la base de datos.

Este MVP constituye la base para futuras mejoras y ampliaciones del sistema.

