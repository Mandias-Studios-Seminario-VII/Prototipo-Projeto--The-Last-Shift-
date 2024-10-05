/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (audio_group_is_loaded(adg_music))
{
	if (room == rm_menu) {
		audio_stop_all(); // Para qualquer música que esteja tocando
		audio_play_sound(msc_title_theme, 0, true); // Toca a música da sala 1 em loop
	} else if (room == rm_fase01) {
		audio_stop_all(); // Para qualquer música que esteja tocando
		audio_play_sound(msc_fase01, 0, true); // Toca a música da sala 2 em loop
	} else if (room == rm_fase02) {
		audio_stop_all(); // Para qualquer música que esteja tocando
		audio_play_sound(msc_fase02, 0, true); // Toca a música da sala 3 em loop
	}
}