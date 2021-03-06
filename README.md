# RandomUserApp

## Instalación

- Hacer Git Clone del proyecto.
- Instalar las dependencias desde la terminal:

cd RandomUserApp
pod install

Si no tienes CocoaPods instalado, en el siguiente link estan las instrucciones: https://cocoapods.org

- Abrir el archivo con extención .xcworkspace en Xcode.
- SHIFT + COMMAND + K -> para limpiar el proyecto.
- COMMAND + B -> para hacer build.
- Por último ejecutar la aplicación.

## iOS Coding Challenge

### Se requiere hacer  una App iOS nativa que hara lo siguiente:

- Presentar una lista de gente en una tabla que contenga los datos obtenidos de *https://randomuser.me/*.
- Esta tabla debe ser populada con los datos provenientes del anteriormente mencionado endpoint en forma paginada. (Obtener 30 resultados por cada página).
- El formato de los requests al endpoint están descritos en *https://randomuser.me/documentation.*
- La tablade gente debe utilizar Custom TableView Cells.
- Las celdas de la tabla deben tener un disclosure mark.
- Las entradas de la tabla deben estar ordenadas por apellido.
- La Master View debe contener un campo de búsqueda dinámico, que vaya filtrando los resultados de acuerdo a lo ingresado en las búsqueda. La búsqueda es sólo por apellido.

### Notas

- El desarrollo debe ser compatible con Xcode 10.1
- La aplicación debe adaptarse a todos los tamaños de pantalla de iPhone.
- Debe correr en iOS > 8.x.
- La aplicación debe correr en portrait y landscape.
- Puede utilizarse Storyboard o XIBs.
- La localización del texto debe ser en inglés.
- Escribir un simple mock Unit Test para el módulo de Networking.

### Requisitos adicionales

- El lenguaje de programación debe ser Swift 4.x (ver NOTA *).
- Usar Alamofire para las operaciones de Networking.
- Usar SDWebimage para el manejo de las imágenes.
- Ambos framworks deben implementarse como Pods. (CocoaPods).

### NOTA *

- Los distintos módulos se deben condificar en Swift 4.x, excepto el controlador de la Detail View, que deben codificarse con Objective - C.
- En todos los textos usar una tipografía que NO sea System Font.
- *Un plus* es que los frames de las imagenes tengan corner radius != 0.

### UI

<img src="https://raw.githubusercontent.com/junierdp/RandomUserApp/master/screen/1.jpeg" align="center" height="500px" width="282px"/>
User List

<img src="https://raw.githubusercontent.com/junierdp/RandomUserApp/master/screen/2.jpeg" align="center" height="500px" width="282px"/>
User Detail
