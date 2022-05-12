# XML schema para `e1.xml`

- El proyecto tiene un atributo `lang` que tomará uno de estos valores: `es`, `en`, `fr`, `ge`.
- El proyecto debe tener un único título, pudiendo tener uno o más autores.
- Puede tener una dedicatoria, si existe debe contener al menos un párrafo.
- Contiene una fecha de publicación válidad y un número de páginas entre 100 y 200.
- La bibliografía, obligatoria, debe contener al menos una referencia. Las referencias tienen el atributo opcional enlace.
- Cada apartado tiene un título seguido de un número variable de secciones.
- Cada sección está compuesta de un título y cero o más párrafos.
- Cada apartado tiene un atributo obligatorio `id` que no se puede repetir en la instancia de datos.
- Cada párrafo tiene un atributo `estilo` con valores `cita`, `codigo`, `revisar` o `normal`. Si no está presente el valor por defecto es `normal`.
- A posteriori Ango incluye el atributo `formato` del número de páginas.

# XSLT para trasformar `e1.xml` en una instancia de datos con distinta estructura

- Nuevo elemento raíz `memoria`. Contiene `titular`, `autores`, `blockquote` y `texto`.
- El elemento `memoria` tiene un atributo `fecha` que obtiene su valor de `fecha_publicacion`.
- El elemento `titular` contiene el título y el idioma entre paréntesis (del atributo `lang` y en formado largo, por ejemplo "Castellano").
- El elemento `autores` contiene los autores separados por coma y con una conjunción final (autor1, autor2, y autor3).
- Las referencias se transforman en elementos `a` donde el atributo `enlace` pasa a ser `href`.
- La dedicatoria pasa a ser un elemento `blockquote` donde los elementos `parrafo` pasan a ser `p`.
- El elemento `texto` contiene los elemento `apartado` con los siguientes cambios:
  - El elemento `titulo` hijo directo de `apartado` se convierte en un `h2` que empieza con el valor del atributo `id` del apartado entre paréntesis.
  - El elemento `titulo` de las secciones se convierten en `h3`.
  - Los `parrafo` cuyo estilo no es `revisar` se convierten en `p`.
  