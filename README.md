# cat_app

## Screens
![Simulator Screen Shot - iPhone 14 Pro Max - 2023-08-20 at 21 01 31](https://github.com/onurgurell/cat-app/assets/69406005/42f770b1-389f-4a9b-9df2-ef42a901016b)


## Architecture
![216790531-eabf218a-18c5-4557-991e-874462152c85](https://github.com/onurgurell/cat-app/assets/69406005/44112b63-e585-4a37-81a3-1a3fd8250307)

## Clean Architeture

# Data

The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations.

# Data Source

Explains the process of obtaining and updating data. It consists of Local Data Sources. SharedPreferences and Json will perform file requests. At the same time, local Data sources cache or persist data.

# Models

An entity will depend on the data acquired from the different data sources. Serialization of JSON structure into Dart maps Entity objects to Models.
Repository Impl

The connection between the Data layer and the Domain layer is established through repositories, which serve as actual implementations in the Domain layer. These repositories are responsible for bringing data from various sources together.

# Domain

The domain layer is responsible for all the business logic. It is written purely in Dart without flutter elements because the domain should only be concerned with the business logic of the application, not with the implementation details.

# Repositories

Abstract classes that define the expected functionality of outer layers.

# Entities

Business objects of the application.

# Use Cases

Describes the logic processing required for the application. Communicates directly with the repositories.

# BLoc

Receive the events from the views and interact with use cases accordingly. Emit the state according to the data received from the use cases. Bloc does not know about the view at all. It communicates in the form of states and events only.

# Presentation

The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.
