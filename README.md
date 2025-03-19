# base_app
# Run App 



First run the code generator:
init step : 
```
make init
```

** If use window can't run make file run this scripts : 

Get sub-module : 
```
git submodule update --init
git submodule update --recursive --remote
git pull --recurse-submodules
flutter pub get 
flutter pub run build_runner build --delete-conflicting-outputs
```


### Run app
```
flutter run -d <my_device>
```


# Project Structure Document
![alt text](https://gitlab.fsel.edu.vn/mobile/planet_defender/blob/main/assets/images/docs/image.jpg?raw=true)
This document provides an overview of the project structure and organization of the app, highlighting the core technologies employed for development. The project follows a modular approach, dividing the codebase into different directories and modules to enhance code reusability and maintainability. The following is a breakdown of the project structure:

```
-- Assets
    |-- env
    |-- fonts
    |-- images
-- Lib 
	|—- common
		|-- configs
		|-- constants
		|-- log
		|-- routers
		|-- storage
		|-- utils
	|—- data
		|-- repositories
		|-- services
		|-- use_cases
	|—- domain
		|-- entities		
		|-- models
			|-- enums
			|-- request
			|-- response
		|-- repositories
		|-- services
		|-- use_cases
	|—- presentation
		|-- bloc
		|-- pages
		|-- themes
		|-- widgets
	|-- app.dart
	|-- init.dart
	|-- main.dart
-- pubspec.yaml
```
## Assets
- **env**: Contains environment-related files or configurations.
- **fonts**: Includes font files used in the application.
- **images**: Consists of image assets used throughout the application.

## Lib
- **common**: This directory holds common code and resources that can be shared across different modules or classes of the application. It includes the following subdirectories:
  - **configs**: For configuration files.
  - **constants**: For storing constant values.
  - **log**: For log files.
  - **routers**: For routing-related files.
  - **storage**: For permanent data storage.
  - **utils**: For utility functions or helper classes.

- **data**: This directory typically contains code related to data processing and access. It includes the following subdirectories:
  - **repositories**: For data repository objects or data access objects.
  - **services**: For data services or APIs.
  - **use_cases**: For defining use cases or business logic related to data operations.

- **domain**: This directory represents the core logic of the application domain. It includes the following subdirectories:
  - **entities**: To define domain entities or business objects.
  - **models**: To represent data models or structures, including the following subdirectories:
    - **enums**: For defining identifying values or constants.
    - **request**: To define request objects or data transfer objects.
    - **response**: To define response objects or data transfer objects.
  - **repositories**: To define specific repositories for the domain or data access interfaces.
  - **services**: To define specific services for the domain or APIs.
  - **use_cases**: To define specific use cases or business logic for the domain.

- **presentation**: This directory contains code related to the user interface and presentation layer of the application. It includes the following subdirectories:
  - **bloc**: For managing state and business logic related to the user interface.
  - **pages**: To define individual screens or pages of the application.
  - **themes**: To manage themes or UI styles.
  - **widgets**: To define reusable UI components or utilities.

- **app.dart**: Main application entry point.
- **init.dart**: Initialization code for the application.
- **main.dart**: Primary file for running the application.

## pubspec.yaml
The `pubspec.yaml` file is used for managing project dependencies and configurations. It specifies the required packages, assets, and other project metadata.

This project structure adheres to a modular and organized approach, promoting code reusability, maintainability, and separation of concerns. The usage of these core technologies facilitates efficient development and enhances the overall quality of the application.

Please refer to the respective documentation and websites of the employed technologies for more detailed information on integrating them into Flutter projects.



