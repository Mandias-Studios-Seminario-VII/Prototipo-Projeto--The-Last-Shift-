/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Tela de Game Over do jogo
if (game_over)
{
	// Informações relacionadas a camera
	var _x01	 = camera_get_view_x(view_camera[0]); // Posição no eixo x inicial da camera
	var _w		 = camera_get_view_width(view_camera[0]); // Largura da camera
	var _x02	 = _x01 + _w; // Posição final da camera no eixo x
	var _meio_w  = _x01 + _w/2; // Centro da camera no eixo x
	var _y01	 = camera_get_view_y(view_camera[0]); // Posição inicial do eixo y
	var _h		 = camera_get_view_height(view_camera[0]); // Altura da camera
	var _y02	 = _y01 + _h; // Posição final da camera no eixo y
	var _meio_h	 = _y01 + _h/2; // Centro da camera no eixo y
	
	var _qtd = _h * .15;
	val = lerp(val, 1, .01);
		
	draw_set_color(c_black);
	// Fazendo a tela ficar escurecida no game over
	draw_set_alpha(val - .3);
	draw_rectangle(_x01, _y01, _x02, _y02, false);
	
	// Desenhando o retangulo de tela preta de cima
	draw_set_alpha(1);
	draw_rectangle(_x01, _y01, _x02, _y01 + _qtd * val, false);
	
	// Desenhando o retangulo de tela preta de baixo
	draw_rectangle(_x01, _y02, _x02, _y02 - _qtd * val, false);
	draw_set_alpha(1);
	draw_set_color(-1);
	
	// Dando um delay para a mensagem de game over aparecer
	if (val >= .85)
	{
		timer_tela_gameover = lerp(timer_tela_gameover, 1, .01);
		// Escrevendo a mensagem de game over
		draw_set_alpha(timer_tela_gameover);
		draw_set_font(fnt_gameover);
		draw_set_valign(1);
		draw_set_halign(1);
		// Sombra do texto
		draw_set_color(c_red);
		draw_text(_meio_w + 1, _meio_h + 1, "G a m e - O v e r");
	
		// Texto de game over
		draw_set_color(c_white);
		draw_text(_meio_w, _meio_h, "G a m e - O v e r");
		draw_set_font(-1);
	
		draw_text(_meio_w , _meio_h + 40, "Pressione ENTER para tentar novamente")
	
		draw_set_valign(-1);
		draw_set_halign(-1);
		draw_set_font(-1);
		draw_set_alpha(-1);
	}
}
else
{
	val = 0;
}