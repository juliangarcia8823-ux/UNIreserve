
# UniReserve

UniReserve es una aplicación móvil desarrollada para facilitar la consulta de espacios universitarios y la gestión de reservas desde una aplicación centralizada.

El proyecto integra una aplicación móvil desarrollada con Flutter, un backend desarrollado con Spring Boot y una base de datos PostgreSQL.

---

## 1. Discovery del proyecto

### Problema identificado

La consulta de espacios universitarios y la gestión de reservas pueden requerir procesos manuales o dispersos, dificultando que los estudiantes conozcan qué espacios existen y gestionen sus reservas de manera organizada.

### Necesidad identificada

Se identifica la necesidad de contar con una solución que permita:

* Consultar los espacios disponibles.
* Visualizar la información de cada espacio.
* Realizar reservas.
* Consultar las reservas realizadas.
* Cancelar reservas.
* Visualizar la confirmación de una reserva.

### Usuario objetivo

El usuario principal del primer MVP es el estudiante universitario que necesita consultar y reservar espacios de la institución.

### Propuesta de solución

UniReserve propone una aplicación móvil conectada a un backend que centraliza la comunicación con la base de datos.

La aplicación permite al usuario consultar los espacios universitarios y gestionar el ciclo básico de una reserva.

### Alcance del primer MVP

El primer MVP se concentra en seis funciones principales:

1. Consultar espacios disponibles.
2. Ver información de un espacio.
3. Realizar una reserva.
4. Consultar mis reservas.
5. Cancelar una reserva.
6. Visualizar la confirmación de una reserva.

---

## 2. Objetivo del proyecto

### Objetivo general

Desarrollar un MVP funcional de UniReserve que permita consultar espacios universitarios y gestionar reservas mediante una aplicación móvil conectada a un backend y una base de datos.

### Objetivos específicos

* Diseñar las historias de usuario del sistema.
* Definir una arquitectura separando aplicación móvil, backend y base de datos.
* Implementar la comunicación entre Flutter y Spring Boot mediante HTTP/JSON.
* Implementar la persistencia de información mediante PostgreSQL.
* Desarrollar las funciones principales de consulta y gestión de reservas.
* Validar el funcionamiento del primer MVP.

---

## 3. Stack tecnológico

| Capa                 | Tecnología       | Uso                                           |
| -------------------- | ---------------- | --------------------------------------------- |
| Aplicación móvil     | Flutter          | Desarrollo de la aplicación móvil             |
| Lenguaje móvil       | Dart             | Programación de la aplicación Flutter         |
| Cliente HTTP         | http 1.6.0       | Comunicación con el backend                   |
| Backend              | Spring Boot      | Desarrollo de la API y lógica del servidor    |
| Lenguaje backend     | Java             | Programación del backend                      |
| API                  | HTTP/JSON        | Comunicación entre aplicación móvil y backend |
| Persistencia         | JDBC             | Conexión del backend con PostgreSQL           |
| Base de datos        | PostgreSQL 17    | Almacenamiento de información                 |
| Contenedores         | Docker           | Ejecución del backend y base de datos         |
| Orquestación local   | Docker Compose   | Administración de los servicios               |
| Control de versiones | Git              | Gestión de versiones                          |
| Repositorio          | GitHub           | Almacenamiento del proyecto                   |
| Plataforma de prueba | Android Emulator | Pruebas de la aplicación móvil                |

---

## 4. Arquitectura de la aplicación

UniReserve utiliza una arquitectura de tres componentes principales:

```text
Aplicación móvil
Flutter / Dart
Android Emulator
        |
        | HTTP / JSON
        v
Backend
Spring Boot / Java
Puerto 8080
        |
        | JDBC
        v
Base de datos
PostgreSQL 17
Puerto 5432
```

La aplicación Flutter no se conecta directamente a PostgreSQL.

La comunicación se realiza mediante el backend de Spring Boot, que procesa las solicitudes de la aplicación móvil y se comunica con la base de datos.

---

## 5. API implementada

### Espacios

```text
GET /api/spaces
GET /api/spaces/{id}
GET /api/spaces/available?date=...&time=...
```

### Reservas

```text
POST /api/reservations
GET /api/reservations/mine
DELETE /api/reservations/{id}
```

---

## 6. Historias de usuario

### HU-01 – Consultar espacios disponibles

Como estudiante, quiero consultar los espacios universitarios disponibles para conocer cuáles puedo utilizar.

### HU-02 – Ver información de un espacio

Como estudiante, quiero visualizar la información de un espacio para conocer sus características antes de realizar una reserva.

### HU-03 – Realizar una reserva

Como estudiante, quiero realizar una reserva de un espacio para utilizarlo en la fecha y horario que necesito.

### HU-04 – Consultar mis reservas

Como estudiante, quiero consultar mis reservas para conocer los espacios que tengo reservados.

### HU-05 – Cancelar una reserva

Como estudiante, quiero cancelar una reserva para liberar el espacio cuando ya no lo necesite.

### HU-06 – Confirmar una reserva

Como estudiante, quiero visualizar la confirmación de mi reserva para verificar que la operación fue registrada correctamente.

---

## 7. Planificación por sprints

### Sprint 1 – Análisis y definición

* Identificación del problema.
* Identificación de la necesidad.
* Identificación del usuario objetivo.
* Definición de historias de usuario.
* Criterios de aceptación.
* Organización inicial del proyecto.

**Resultado:** definición de las seis historias de usuario principales.

### Sprint 2 – Base de datos y backend

* Configuración de PostgreSQL.
* Desarrollo del backend con Spring Boot.
* Conexión mediante JDBC.
* Implementación de endpoints.
* Configuración de Docker.

**Resultado:** backend funcional conectado a PostgreSQL.

### Sprint 3 – Aplicación móvil e integración

* Desarrollo de interfaces en Flutter.
* Implementación del servicio HTTP.
* Integración con el backend.
* Consulta de espacios.
* Visualización de información de espacios.

**Resultado:** aplicación móvil comunicándose con el backend.

### Sprint 4 – Reservas y validación

* Implementación de reservas.
* Consulta de reservas.
* Cancelación de reservas.
* Confirmación de reservas.
* Pruebas funcionales.
* Generación del APK.

**Resultado:** primer MVP funcional de UniReserve.

---

## 8. Estrategia de ramas Git

El proyecto utiliza tres ramas principales:

```text
main
 |
 | versión estable
 |
develop
 |
 | integración y desarrollo
 |
qa
 |
 | pruebas y validación
```

### main

Contiene la versión estable del proyecto.

### develop

Se utiliza para integrar y desarrollar los cambios antes de llevarlos a validación.

### qa

Se utiliza para realizar pruebas y validar los cambios antes de incorporarlos a la versión estable.

### Flujo de trabajo

```text
Desarrollo
    |
    v
develop
    |
    v
qa
    |
    v
Validación
    |
    v
main
```

---

## 9. Documentación del proyecto

La documentación se encuentra organizada en:

```text
docs/
├── historias_usuario/
│   └── historias_de_usuario.md
├── arquitectura/
│   └── arquitectura.md
├── base_de_datos/
│   └── base_de_datos.md
├── sprints/
│   └── plan_sprints.md
└── mvp/
    └── primer_mvp.md
```

Documentos:

* [Historias de usuario](docs/historias_usuario/historias_de_usuario.md)
* [Arquitectura](docs/arquitectura/arquitectura.md)
* [Base de datos](docs/base_de_datos/base_de_datos.md)
* [Planificación de sprints](docs/sprints/plan_sprints.md)
* [Primer MVP](docs/mvp/primer_mvp.md)

---

## 10. Estructura general del proyecto

```text
UNIreserve/
├── android/
├── ios/
├── lib/
│   ├── models/
│   ├── services/
│   ├── viewmodels/
│   └── views/
├── docs/
├── test/
├── pubspec.yaml
├── README.md
└── .gitignore
```

El backend se encuentra en el proyecto independiente de Spring Boot y se ejecuta mediante Docker junto con PostgreSQL.

---

## 11. Estado actual

Actualmente UniReserve cuenta con un MVP funcional que integra:

* Aplicación móvil Flutter.
* Backend Spring Boot.
* Base de datos PostgreSQL.
* Comunicación HTTP/JSON.
* Persistencia mediante JDBC.
* Contenedores Docker.
* Consulta de espacios.
* Información de espacios.
* Realización de reservas.
* Consulta de reservas.
* Cancelación de reservas.
* Confirmación de reservas.

El proyecto Flutter fue validado mediante `flutter analyze` sin problemas reportados y se generó el APK para Android.

---

## 12. Repositorio y ramas

Repositorio oficial:

`https://github.com/juliangarcia8823-ux/UNIreserve`

Ramas principales:

* `main` — versión estable.
* `develop` — desarrollo e integración.
* `qa` — pruebas y validación.

---

## 13. Propósito académico

UniReserve se desarrolla como proyecto académico para aplicar conceptos de:

* Ingeniería de software.
* Historias de usuario.
* Arquitectura de aplicaciones.
* Desarrollo móvil.
* Desarrollo backend.
* Bases de datos.
* Metodologías ágiles.
* Control de versiones.
* Pruebas y validación.

---

## 14. Conclusión

UniReserve representa una primera versión funcional orientada a resolver el proceso básico de consulta y reserva de espacios universitarios.

El proyecto establece una base tecnológica separada entre aplicación móvil, backend y base de datos, permitiendo mantener una estructura organizada para continuar con la evolución del sistema.
