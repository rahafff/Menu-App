
# Menu App

To make this project work on your Platform 

## Lets Getting Started
First of all what we need to make this project work on our platforms

> ## Requirements
 1. Android Studio 4.2+
 2. Android sdk 
 3. Flutter sdk 2.2 ~ 2.3 (If your flutter sdk is above 2.3 you may need to migrate the project to your preference by following this link (https://flutter.dev/docs/development/androidx-migration)
 

>  ## How to Use
**Step 1:**
Download or clone this repo by using the link below:

       git clone https://github.com/rahafff/Menu-App.git
       
**Step 2:**
Go to project root and execute the following command in console to get the required dependencies: 

     flutter pub get 


**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

> ## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```


> ## Flutter Setup

After install all the kit in the requirements make sure to download flutter and dart plugins
In your IDE terminal write flutter doctor to check your sdk's status

>  **Before Run Projects**


**For Android only**

Please check of your build config in the dir : Project -> android -> app -> build.gradle 

    buildTypes {
        release {
    
            // make sure to set signingConfigs to debug if you don't have release key
            
            signingConfig signingConfigs.debug
    
        }
    }



# Finally
In Android studio menu tools -> Flutter -> Flutter Pub Get




