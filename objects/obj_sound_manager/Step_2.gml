/// @desc efeitos sonoros do jogo

// Efeitos sonoros do jogador
#region som_jogador
// Condição para o efeito sonoro ser ouvido
if (attack_snd == true)
{
	//Tocando o efeito sonoro de ataque
	audio_play_sound(snd_jogador_attack, 1, false);

	//Resetando a variavel
	attack_snd = false;
}

if (jump_snd == true)
{
	// Tocando o efeito sonoro de pulo
	audio_play_sound(snd_jogador_jump, 1, false);
	
	jump_snd = false;
}

if (damage_snd == true)
{
	// Tocandoo efeito sonoro de dano no jogador
	audio_play_sound(snd_jogador_hurt, 1, false);
	
	damage_snd = false;
}

if (game_over_snd == true)
{
	// Tocando efeito sonoro de game-over
	audio_play_sound(snd_jogador_morto, 1, false);
	
	game_over_snd = false;
}

if (land_snd == true)
{
	// Tocando efeito sonoro de aterrissagem
	audio_play_sound(snd_jogador_land, 1, false);
	
	land_snd = false;
}
#endregion
