/// @desc Configurações de menu, variaveis e GUI
#macro SAVEFILE "Save.sav"

gui_larg	= display_get_gui_width();
gui_alt		= display_get_gui_height();
gui_margem	= 32;

menu_x = gui_larg + 200;
menu_y = gui_alt - gui_margem;
menu_x_alvo = gui_larg - gui_margem;
menu_vel = 25; // menor valor mais rapido fica
menu_fonte = fnt_menu;
menu_item_alt = font_get_size(fnt_menu);
menu_ajuste = -1;
menu_controle = true;

// Array de opções do menu
menu[4] = "Novo Jogo"; 
menu[3] = "Continuar"; 
menu[2] = "Creditos"; 
menu[1] = "Opções";
menu[0] = "Sair";

menu_items = array_length(menu);
menu_selecao = 4;
