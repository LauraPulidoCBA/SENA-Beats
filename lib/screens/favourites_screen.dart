import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favourites_provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavouritesProvider>();
    final favs = favProvider.favourites;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Favoritos')),
      body: favs.isEmpty
          ? const Center(child: Text('Aún no tienes canciones favoritas'))
          : ListView.builder(
              itemCount: favs.length,
              itemBuilder: (context, index) {
                final track = favs[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      track.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // ✅ Evita las líneas rojas si falla la conexión
                        return Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey[800],
                          child: const Icon(
                            Icons.music_note,
                            color: Colors.white54,
                          ),
                        );
                      },
                    ),
                  ),
                  title: Text(track.title),
                  subtitle: Text(track.artist),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => favProvider.toggleFavourite(track),
                  ),
                );
              },
            ),
    );
  }
}
