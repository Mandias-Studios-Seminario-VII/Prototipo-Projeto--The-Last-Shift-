/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (audio_group_is_loaded(adg_music))
{
	if (room == rm_menu_inicial) {
		audio_stop_all(); // Para qualquer música que esteja tocando
		audio_play_sound(msc_title_theme, 0, true); // Toca a música da sala 1 em loop
	} else if (room == rm_fase01) {
		audio_stop_all(); // Para qualquer música que esteja tocando
		audio_play_sound(msc_fase01, 0, true); // Toca a música da sala 2 em loop
	} else if (room == rm_creditos) {
		audio_stop_all();
		audio_play_sound(msc_creditos, 0, true);
	} else if (room == rm_final) {
		audio_stop_all();
		audio_play_sound(msc_cena_final, 0, true);
	}
}
