/// @desc Configurações de menu, variaveis e GUI
#macro SAVEFILE "Save.sav"

gui_larg	= display_get_gui_width();
gui_alt		= display_get_gui_height();
gui_margem = 32;

menu_x = gui_larg / 2; // Centalizado ao eixo x
menu_y = gui_alt / 2; // Centralizado ao eixo y
menu_x_alvo = gui_larg - gui_margem;
menu_vel = 18; // menor valor mais rapido fica
menu_fonte = fnt_menu;
menu_item_alt = font_get_size(fnt_menu);
menu_ajuste = -1;
menu_controle = true;

// Array de opções do menu
menu_inicial[0] = "Novo Jogo";
menu_inicial[1] = "Continuar";
menu_inicial[2] = "Creditos";
menu_inicial[3] = "Opcoes"; 
menu_inicial[4] = "Sair";

menu_itens = array_length(menu_inicial);
menu_selecao = 0; // Seleção começa sobre a opção "Novo Jogo"