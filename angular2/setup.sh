#!/bin/bash
# setup.sh
# Shell Script for prepare the basic Angular 2 structure file

# Angular app folder

echo "[ng-setup] app/ folder..."
mkdir app
echo "[ng-setup] app/ folder successfully created"

# HTML file
# index.html

echo "[ng-setup] Creating default Angular 2 index.html file..."

echo '<!DOCTYPE html>
<html>
  <head>
    <title>Default</title>
  </head>
<body>
   <my-app>Loading...</my-app>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-shim/0.33.3/es6-shim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/systemjs/0.19.20/system-polyfills.js"></script>
    <script src="https://code.angularjs.org/2.0.0-beta.6/angular2-polyfills.js"></script>
    <script src="https://code.angularjs.org/tools/system.js"></script>
    <script src="https://code.angularjs.org/tools/typescript.js"></script>
    <script src="https://code.angularjs.org/2.0.0-beta.6/Rx.js"></script>
    <script src="https://code.angularjs.org/2.0.0-beta.6/angular2.dev.js"></script>
    <script>
      System.config({
        transpiler: "typescript",
        typescriptOptions: { emitDecoratorMetadata: true },
        packages: {
          "app": {
            defaultExtension: "ts"
          }
        }
      });
      System.import("/app/environment.main")
            .then(null, console.error.bind(console));
    </script>
</body>
</html>' >> index.html

echo "[ng-setup] default index.html file successfully created"
echo "[ng-setup] INFO: Create a /app/environment.main.ts file into app/ directory"

# JSON files
# tsconfig.json

echo "[ng-setup] Creating tsconfig.json file..."

echo '{
  "compilerOptions": {
    "target": "es5",
    "module": "system",
    "moduleResolution": "node",
    "sourceMap": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "removeComments": false,
    "noImplicitAny": false
  },
  "exclude": [
    "node_modules",
    "typings/main",
    "typings/main.d.ts"
  ]
}' >> tsconfig.json

echo "[ng-setup] tsconfig.json file successfully created"

# typings.json

echo "[ng-setup] Creating default Angular 2 typings.json file..."

echo '{
  "globalDependencies": {
    "core-js": "registry:dt/core-js#0.0.0+20160602141332",
    "jasmine": "registry:dt/jasmine#2.2.0+20160621224255",
    "node": "registry:dt/node#6.0.0+20160621231320"
  }
}' >> typings.json

echo "[ng-setup] default typings.json file successfully created"

# package.json

echo "[ng-setup] Creating default Angular 2 package.json file..."

echo '{
  "name": "angular2-demo",
  "version": "1.0.0",
  "scripts": {
    "start": "concurrent \"npm run tsc:w\" \"npm run lite\" ",
    "tsc": "tsc",
    "tsc:w": "tsc -w",
    "lite": "lite-server",
    "typings": "typings",
    "postinstall": "typings install"
  },
  "license": "ISC",
  "dependencies": {
    "angular2": "2.0.0-beta.7",
    "systemjs": "0.19.22",
    "es6-promise": "^3.0.2",
    "es6-shim": "^0.33.3",
    "reflect-metadata": "0.1.2",
    "rxjs": "5.0.0-beta.2",
    "zone.js": "0.5.15"
  },
  "devDependencies": {
    "concurrently": "^2.0.0",
    "lite-server": "^2.1.0",
    "typescript": "^1.7.5",
    "typings":"^0.6.8"
  }
}' >> package.json

echo "[ng-setup] default package.json file successfully created"
echo "[ng-setup] run the Angular app with: npm start"