/// @description Evento draw_gui do obj_pausa
// Desenhando os botões do jogo (Só funciona aqui!!)
draw_sprite_ext(spr_vk_pausar, 0, 1664, 32, 1, 1, 0, c_white, 1); // Desenhando o botão de pausa
draw_sprite_ext(spr_vk_som, 0, 1536, 32, 1, 1, 0, c_white, 1); // Desenhando o botão de Ativar/Desativar som
draw_sprite_ext(spr_vk_retornar, 0, 1792, 32, 1, 1, 0, c_white, 1); // Desenhando o botão de retorno

if (esta_pausado)
{
	
	
    // Define a fonte e a cor do texto
    draw_set_font(fnt_pausa);
    draw_set_color(c_white);
	
    // Mensagem principal "JOGO PAUSADO"
    var _texto_pausado = "JOGO PAUSADO";
    var _largura_texto1 = string_width(_texto_pausado);
    var _altura_texto1 = string_height(_texto_pausado);
    draw_text((largura_res - _largura_texto1) / 2, (altura_res / 2) - _altura_texto1, _texto_pausado);
    
    // Mensagem secundária "pressione o botão de pausa novamente para retornar"
    var _texto_instrucao = "Pressione o botão de pausa novamente para retornar";
    var _largura_texto2 = string_width(_texto_instrucao);
    draw_text((largura_res - _largura_texto2) / 2, (altura_res / 2) + _altura_texto1, _texto_instrucao);
}
