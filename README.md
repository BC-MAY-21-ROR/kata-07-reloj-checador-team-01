![BrightCoders Logo](img/logo-bc.png)

# Reloj Checador App

![cover](img/cover.jpg)

## Pre-requisitos

Antes de iniciar debes instalar las siguientes herramientas, evaluar tu código e identificar posibles mejoras.

- [Instalar y utilizar Rubocop](https://github.com/bright-coders/commons/tree/master/topics/rubocop)
- [Instalar y utilizar Rubycritic](https://github.com/bright-coders/commons/tree/master/topics/rubycritic)
- [Instalar y utilizar SandiMeter](https://github.com/makaroni4/sandi_meter)

## Requerimientos funcionales

Foo Corp needs a system to control their employees attendance to their offices, they need full visibility of who went to work at what time and when they left. They need a webpage that will be opened in a tablet at the lobby of each branch, where the employee can go in and specify their private number and the system will record internally the time they checked in and the time they checked out.

The attendance web app must meet the following reuqirements:

- Admin
  - Admin portal protected with basic auth
  - Manage employees (CRUD operations)
    - Deactivate employees instead of deleting them
    - Store: email, name and position, employee #, private number
  - Manage Company branches (CRUD operations)
    - Store: name, address
  - Reports
    - Attendance by day
    - Average time employees checked in/out by month
    - Absence report by month
- Frontend
  - Employee registration page
    - Private number input screen
    - Feedback to employee on successful/failed registration

## Requerimientos no-funcionales

- Calidad
  - Utilizar estilo de código definido por la comunidad (apoyarse en Rubocop)
  - Pruebas unitarias
  - Puntuación en Rubycritic: por lo menos 90 en la carpeta de la App y por lo menos 65 en la carpeta de pruebas
  - Utilizar SandiMeter para analizar el código y utilizar el resultado para hacer mejoras
  - Presentación correcta en las versiones más recientes de los principales navegadores: Edge, Chrome, Safari y Firefox
- Deployment
  - Configuración de un servidor web (heroku o similar) para el deployment automático de actualizaciones de la app
  - [Configuración de un servidor de integración continua como Travis CI o Circle CI](https://circleci.com/features/ruby/)
- Frontend
  - CSS: libertad para utilizar cuaquier framework o librería, preferentemente SASS
    - Por ejemplo puedes utilizar Bootsrap junto con [bootstrap_form](https://github.com/bootstrap-ruby/bootstrap_form) para tus formularios

## Procesos para realizar una correcta ejecución.

_Este proyecto cuenta con una serie de procesos necesarios para realizar una ejecución correcta._

### Configuracion de las variables de entorno.

_Crear un archivo .env el cual contenga los datos correspondientes a tu base de datos_

### Creacion de la base de datos.

_EJecutar el comando:_

```
rails db:create
```

### Instalación de las gemas mediante el uso de Bundle.

_EJecutar el comando:_

```
bundle install
```

### Instalación de las dependencias necesarias.

_EJecutar el comando:_

```
yarn
```

### Ejecución del webpack.

_EJecutar el comando:_

```
./bin/webpack-dev-server
```

### Ejecución del servidor de Rails.

_EJecutar el comando:_

```
rails s
```

## Tecnologías

| Tecnologías   | Description                                                                                     | Version |
| ------------- | ----------------------------------------------------------------------------------------------- | ------- |
| Ruby          | Lenguaje de programación aplicado para la lógica del lado del backend.                          | 3.0.0   |
| Ruby on Rails | Framework basado en Ruby para la estrucutra del apartado del backend.                           | 6.1.4.1 |
| PostgreSQL    | Show file differences that haven't been staged                                                  | 1.2.3   |
| Sass          | Implementado para la generación de estilos.                                                     | 6.0.0   |
| React.js      | Libreria basada en javascript implementada en el apartado del frontend.                         | 2.6.1   |
| Javascript    | Lenguaje de programación aplicado para la lógica del lado del frontend.                         | ES6     |
| Rspec         | Herramienta implementada para el desarrollo de pruebas unitarias y automatización.              | 5.0.2   |
| Rubycritic    | Herramienta que nos proporciona un informe de calidad del código Ruby.                          | 4.6.1   |
| Rubocop       | Herramienta encargada para cumplir con varias de las directrices que de la Guía de Estilo Ruby. | 1.22.0  |
