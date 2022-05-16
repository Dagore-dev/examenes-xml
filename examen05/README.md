# XML Schema para `e1.xml`
- El inventario puede no tener espacios
- Los elementos `responsable` y `mail` son obligatorios. `tel` no es obligatorio y pueden aparacer hasta 3 distintos.
- `tel` tiene el atributo obligatorio `tipo`. `tipo` puede tener como valores `particular`, `trabajo` o `móvil`.
- `tel` tiene un formato definido: contiene entre 4 y 8 dígitos.
- Todos los espacios tienen un `nombre`, `responsable` y un número variable de elementos `item`.
- Los `espacio` tienen un código que no se puede repetir.
- Cada `item` tiene `nombre`, `ns`, `cantidad`, y al menos un elemento `categoria`.

# XSLT para `e1.xml`
- El nuevo elemento raíz es `listado`.
- El responsable del inventario pasa a ser un elemento `mantiene` con el valor del elemento `mail` en un atributo `correo`.
- Se listan todos los elementos `tel`, si el telefono es tipo `particular` en su lugar se utiliza el elemento `particular`.
- Los responsables de cada espacio se muestran numerados y separados por comas dentro de un elemento `responsables`.
- Se genera el elemento `detalle` que contendrá los espacios tras la transformación.
- Cada espacio genera un comentario con los espacios formateados como: `Espacio <code>: <nombre del espacio>`.
- Después se listan elementos `item` con cantidad distinta de cero. Contiene la cantidad y nombre directamente como texto.
- Los elemento `item` se muestran ordenados de menor a mayor cantidad.
