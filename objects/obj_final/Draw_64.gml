/// @desc Desenhando o texto da cena de corte final
draw_set_color(c_black)
draw_rectangle(0, 0, res_larg, 128, false);
draw_rectangle(0, res_alt - 128, res_larg, res_alt, false);

draw_set_color(c_white);
draw_set_font(fnt_final);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(res_larg * 0.5 + 2, res_larg * 0.3 + 2, texto);
draw_set_color(c_white);
draw_text(res_larg * 0.5, res_larg * 0.3, texto);