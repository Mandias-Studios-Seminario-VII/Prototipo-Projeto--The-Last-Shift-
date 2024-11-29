/// @desc Desenhando o botão de efeitos sonoros

// Desenha a sprite correspondente ao estado dos efeitos sonoros
if (global.efeitos_ativos) {
    draw_sprite_ext(spr_vk_efeito_sonoro, 0, 864, 384, 1, 1, 0, c_white, 1)
} else {
    // Desenha a sprite desativada em tom cinza (op
	draw_sprite_ext(spr_vk_efeito_desativado, 0, 864, 384, 1, 1, 0, c_gray, 1.0);
}