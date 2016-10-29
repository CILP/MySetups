#!/bin/bash
# setup.sh
# Shellupdated. Script for prepare the basic Angular 2 structure files
# For Angular 2.1.2

# Angular app folder

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)Creating app/ folder..."

mkdir app
echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)app/ folder successfully created"

cd app

# Essential app files app/
# app.component.ts
echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)Creating default app/app.component.ts file"

echo "import { Component } from '@angular/core';

@Component({
  selector: 'my-app',
  template: '<h1>My First Angular App</h1>'
})

export class AppComponent { }" >> app.component.ts

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)app/app.component.ts file successfully created"

# app.module.ts file
echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)Creating default app/app.module.ts file"

echo "import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';

@NgModule({
  imports:      [ BrowserModule ],
  declarations: [ AppComponent ],
  bootstrap:    [ AppComponent ]
})

export class AppModule { }" >> app.module.ts

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)app/app.module.ts file successfully created"

# main.ts
echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)Creating default app/main.ts file"

echo "import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app.module';

const platform = platformBrowserDynamic();
platform.bootstrapModule(AppModule);" >> main.ts

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0)app/main.ts file successfully created"

# Return to root directory
cd ..

# HTML file
# index.html

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) Creating default Angular 2 index.html file..."

echo '<!DOCTYPE html>
<html>
  <head>
    <title>Angular QuickStart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css">
    <!-- 1. Load libraries -->
     <!-- Polyfill(s) for older browsers -->
    <script src="node_modules/core-js/client/shim.min.js"></script>
    <script src="node_modules/zone.js/dist/zone.js"></script>
    <script src="node_modules/reflect-metadata/Reflect.js"></script>
    <script src="node_modules/systemjs/dist/system.src.js"></script>
    <!-- 2. Configure SystemJS -->
    <script src="systemjs.config.js"></script>
    <script>
      System.import("app").catch(function(err){ console.error(err); });
    </script>
  </head>
  <!-- 3. Display the application -->
  <body>
    <my-app>Loading...</my-app>
  </body>
</html>' >> index.html

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) default index.html file successfully created"
echo "$(tput setaf 3)[ng-setup] $(tput sgr 0) INFO: Create a /app/environment.main.ts file into app/ directory"

# JSON files
# tsconfig.json

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) Creating tsconfig.json file..."

echo '{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "moduleResolution": "node",
    "sourceMap": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "removeComments": false,
    "noImplicitAny": false
  }
}' >> tsconfig.json

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) tsconfig.json file successfully created"

# package.json

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) Creating default Angular 2 package.json file..."

echo '{
  "name": "angular-quickstart",
  "version": "1.0.0",
  "scripts": {
    "start": "tsc && concurrently \"tsc -w\" \"lite-server\" ",
    "lite": "lite-server",
    "tsc": "tsc",
    "tsc:w": "tsc -w"
  },
  "licenses": [
    {
      "type": "MIT",
      "url": "https://github.com/angular/angular.io/blob/master/LICENSE"
    }
  ],
  "dependencies": {
    "@angular/common": "~2.1.1",
    "@angular/compiler": "~2.1.1",
    "@angular/core": "~2.1.1",
    "@angular/forms": "~2.1.1",
    "@angular/http": "~2.1.1",
    "@angular/platform-browser": "~2.1.1",
    "@angular/platform-browser-dynamic": "~2.1.1",
    "@angular/router": "~3.1.1",
    "@angular/upgrade": "~2.1.1",
    "angular-in-memory-web-api": "~0.1.13",
    "bootstrap": "^3.3.7",
    "core-js": "^2.4.1",
    "reflect-metadata": "^0.1.8",
    "rxjs": "5.0.0-beta.12",
    "systemjs": "0.19.39",
    "zone.js": "^0.6.25"
  },
  "devDependencies": {
    "@types/core-js": "^0.9.34",
    "@types/node": "^6.0.45",
    "concurrently": "^3.0.0",
    "lite-server": "^2.2.2",
    "typescript": "^2.0.3"
  }
}' >> package.json

# systemjs.config.js

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) Creating default Angular 2 systemjs.config.js file..."

echo "/**
 * System configuration for Angular samples
 * Adjust as necessary for your application needs.
 */
(function (global) {
  System.config({
    paths: {
      // paths serve as alias
      'npm:': 'node_modules/'
    },
    // map tells the System loader where to look for things
    map: {
      // our app is within the app folder
      app: 'app',
      // angular bundles
      '@angular/core': 'npm:@angular/core/bundles/core.umd.js',
      '@angular/common': 'npm:@angular/common/bundles/common.umd.js',
      '@angular/compiler': 'npm:@angular/compiler/bundles/compiler.umd.js',
      '@angular/platform-browser': 'npm:@angular/platform-browser/bundles/platform-browser.umd.js',
      '@angular/platform-browser-dynamic': 'npm:@angular/platform-browser-dynamic/bundles/platform-browser-dynamic.umd.js',
      '@angular/http': 'npm:@angular/http/bundles/http.umd.js',
      '@angular/router': 'npm:@angular/router/bundles/router.umd.js',
      '@angular/forms': 'npm:@angular/forms/bundles/forms.umd.js',
      // other libraries
      'rxjs':                      'npm:rxjs',
      'angular-in-memory-web-api': 'npm:angular-in-memory-web-api',
    },
    // packages tells the System loader how to load when no filename and/or no extension
    packages: {
      app: {
        main: './main.js',
        defaultExtension: 'js'
      },
      rxjs: {
        defaultExtension: 'js'
      },
      'angular-in-memory-web-api': {
        main: './index.js',
        defaultExtension: 'js'
      }
    }
  });
})(this);
" >> systemjs.config.js

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) default system.config.js file successfully created"

echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) default package.json file successfully created"
echo "$(tput setaf 2)[ng-setup] $(tput sgr 0) $(tput bold)run the Angular app with: npm start $(tput sgr 0)"