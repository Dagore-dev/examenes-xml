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
