
# Cambios y correcciones identificadas en SENA Beats

- **Orden incorrecto en la navegación**  
  Los botones de la barra (`Buscar`, `Misiones`, `Favoritos`, `Perfil`) estaban intercambiados y mostraban pantallas equivocadas. Se corrigió el orden en `main_screen.dart` para que cada ícono abra la vista correspondiente.

- **Animación de íconos en la barra inferior**  
  Al presionar un ícono, toda la barra se animaba en lugar de solo el ícono seleccionado.

- **Tamaño fijo en las miniaturas de canciones**  
  Las imágenes de las canciones tenían un tamaño predeterminado y no se adaptaban correctamente.

- **Pantalla de búsqueda sin contenido inicial**  
  La vista `SearchScreen` no mostraba canciones populares o aleatorias al inicio. 

- **Reproducción limitada a la imagen de la canción**  
  Solo era posible iniciar la reproducción tocando la foto. 

- **MiniPlayer sin navegación**  
  El MiniPlayer inferior mostraba la canción activa, pero no permitía abrir la pantalla de detalle.

- **Pantalla Misiones sin identificación**  
  La vista `Misiones` debería reconocer si está en el **SENA Mosquera** y mostrar misiones relacionadas con esa ubicación.

- En los favoritos la cancion no se reproduce

- El repruductor se traba y se pausa y se tiene que volver a presionar el boton reproducir

---


