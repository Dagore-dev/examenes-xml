# XML Schema para `m1.xml`

- El elemento raíz tiene el atributo obligatorio `version` y el atributo opcional `added`.
- Se espera un único elemento `owner` y de manera opcional un elemento `desc`.
- Debe existir al menos un elemento `folder` y puede haber más de uno.
- Cada elemento `folder` debe tener:
  - Un elemento `title` único y obligatorio.
  - Un elemento `desc` único y opcional.
  - Cualquier número de elementos `bookmark`.
- Cada elemento `bookmark` presenta:
  - `title` único y obligatorio.
  - `desc` único y opcional.
  - Atributo `href` con la URL del enlace.
  - Elemento opcional `ranking`. Contiene un decimal entre 0 y 100 y presenta un atributo `type` con los valores: `google`, `yahoo` y `altavista`.
  - Cualquier número de elementos `tag`.

# XSLT para trasformar `m1.xml` en una instancia de datos con distinta estructura

- El elemento raíz pasa a ser `favoritos`. Presenta un atributo `propietario` con el valor del elemento `owner`.
- Si existía el atributo `added` se transforma en un elemento `fecha` hijo directo de la raíz.
- Cada elemento `folder` deja de existir y se transforma en un comentario del tipo:
```
  <!-- Comentario:  -->
  <!--{Valor del elemento title del elemento folder}-->
```
- Cada elemento `bookmark` genera un elemento `item`.
- Los elementos `bookmark` que no presenta elemento `ranking` o este vale cero no se transforman.
- Los elementos `item` de cada `folder` se ordenan por su `ranking` de mayor a menor.
- Cada elemento `item` contiene:
  - Elemento `puntos` con el valor del elemento `ranking`.
  - Elemento `titulo` con valor obtenido el `title` en el elemento `bookmark` contenedor.
  - Elemento `url` con el valor del enlace.
  - Elemento `etiquetas` donde aparecen el valor de todas las etiquetas `tag` separadas por `#`.
