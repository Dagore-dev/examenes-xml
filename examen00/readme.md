# XML schema para `examen.xml`

- Elemento raíz: filmoteca.
- La colección puede tener uno o más de un propietario.
- El precio de venta es opcional.
- El número de películas puede ser cero, el elemento peliculas debe existir siempre.
- El título original es opcional, puede tener un atributo `lang` con los valores `en`, `es` o `fr`.
- El cartel es un elemento vacío con un atributo `fuente` obligatorio.
- Cada película tiene un atributo `código` que debe ser un identificador único.
- La duración se mide en minutos.
- El director es uno y solo uno.
- El reparto está compuesto de al menos un actor.
- La sinopsis contiene al menos un párrafo.
