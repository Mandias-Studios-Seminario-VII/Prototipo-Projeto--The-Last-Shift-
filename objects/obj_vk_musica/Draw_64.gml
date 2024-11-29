/// @desc Desenhando o botão de musica
/// @desc Desenhando o botão de efeitos sonoros

// Desenha a sprite correspondente ao estado dos efeitos sonoros
if (global.musica_ativa) {
    draw_sprite_ext(spr_vk_musica, 0, 864, 608, 1, 1, 0, c_white, 1)
} else {
    // Desenha a sprite desativada em tom cinza (op
	draw_sprite_ext(spr_vk_musica_desativada, 0, 864, 608, 1, 1, 0, c_gray, 1.0);
}
