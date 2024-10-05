/// Desenhando o menu do jogo

// Definindo a fonte do menu
draw_set_font(fnt_menu);

// Colocando o texto no meio da tela
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

// Denhando as opções
for (var _i = 0; _i < menu_items; _i++)
{

	var _desvio = 2;
	
	// Desenhando o item do menu
	var _texto = menu[_i];
	
	// Verificando se a seleção está no texto atual
	if (menu_selecao == _i)
	{
		_texto = string_insert("> ", _texto, 0);
		var _cor = c_white;
	}
	else
	{
		var _cor = c_gray;
	}
	var _xx = menu_x;
	var _yy = menu_y - (menu_item_alt * (_i * 1.5))
	draw_set_color(c_black);
	draw_text(_xx - _desvio, _yy, _texto);
	draw_text(_xx + _desvio, _yy, _texto);
	draw_text(_xx, _yy + _desvio, _texto);
	draw_text(_xx, _yy - _desvio, _texto);
	draw_set_color(_cor);
	draw_text(_xx, _yy, _texto);
}