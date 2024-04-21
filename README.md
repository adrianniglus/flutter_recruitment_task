# ⚡ Flutter Recruitment Task ⚡
This is my recruitment task. I did some changes and added several "real life scenario" development features like flavors, analysis options, build options, TMDB API Key encryption.

Additionaly I decided to add translations, keyboard hiding and of course our beloved unit tests!

Hope you like it :)

## 🚀 Getting Started
1. Create `.env` file in main app folder

    Inside of it, create 2 variables and provide keys:
    ```shell
    TMDB_STAGING_KEY=[your_tmdb_key]
    TMDB_PROD_KEY=[your_tmdb_key]
    ```
    Use the key that you provided in this task .zip file repository.

2. Generate app files:

    To create necessary app files just use:
    ```shell
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

    and to create translation files use:
    ```shell
    flutter pub run intl_utils:generate
    ```
3. Run app:

    To run app use `flutter run --flavor [wanted_flavor]` eg:
    ```shell
    flutter run --flavor staging
    ```
This works both for Android and Ios. 

### Available flavors


|flavor name|status|description| bundle/app ID          |
|---|---|---|------------------------|
|`staging`|in progress|flavor/env for internal testing| `com.example.flutter_recruitment_task.staging`      |
|`prod`|in progress|flavor for production| `com.example.flutter_recruitment_task` |

# 📚 Architecture and tech stack
App and data flow:
DataSource -> Repository -> UseCase -> Cubit -> Page

1. **DataSource** - calls to native platforms, external libraries and performs heavy lifting
2. **Repository** - calls data source and performs error handling
3. **UseCase** - represents single business process performed in app
4. **Cubit & Page** - presentation layer operations

## 🚩 State management

- For business logic use [flutter_bloc](https://pub.dev/packages/flutter_bloc)

## 📂 File structure
This app's file structure is based on [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).
```
lib/
    app/                         	    <-- application layer
        pages/
          movie_list_page/
	        movie_list_page.dart        <-- page
            cubit/
	            movie_list_cubit.dart	<-- cubit
	            movie_list_state.dart   <-- state
        common_widgets/                 <-- custom widgets
        utils/                    	    <-- utility classes/constants, translations, router
    data/                         	    <-- data layer
        api/
            auth_client.dart            <-- calls to REST API
        repositories/
			movie_repository_impl.dart 	<-- handles calls to data source and error handling
        data_source/
		    movie_data_source.dart      <-- calls to data source eg. data base or REST API
        dtos/                           <-- data transfer objects
        handlers/                       <-- handlers eg. REST API environments or keys
        network_config/                 <-- REST API endpoints constants
        utils/                    	    <-- utility classes/constants
    domain/                       	    <-- domain layer (business and enterprise)
        models/                         <-- enterprise entities (core classes of the app)
            movies/
                movie.dart              <-- single enterprise entity
        use_case/                       <-- business processes e.g. Search Movie, Get Movie Details etc..
          get_movie_details_use_case.dart       <-- example usecase extends `UseCase` or `NoParamUseCaseSimple`
        repositories/                   <-- abstract classes that define functionality for data layer
        data_source/                    <-- abstract classes that define functionality for data layer
        utils/                    	    <-- utility classes/constants, enums, extensions
    main.dart                     	    <-- entry point
    movie_app.dart                     	<-- App class, contains global configurations

```

