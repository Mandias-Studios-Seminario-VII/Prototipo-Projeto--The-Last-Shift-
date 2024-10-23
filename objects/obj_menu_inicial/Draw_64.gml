/// Desenhando o menu do jogo

// Definindo a fonte do menu
draw_set_font(fnt_menu);
draw_set_halign(fa_center); // Alinhamento horizontal centralizado
draw_set_valign(fa_middle);  // Alinhamento vertical ao meio

// Pegando a altura e largura da GUI
gui_larg = display_get_gui_width();
gui_alt = display_get_gui_height();

// Altura de cada item do menu (considerando o espaçamento entre eles)
var item_altura = menu_item_alt * 1.5; // Ajuste o espaçamento vertical

// Centralizando o menu no eixo X
menu_x = gui_larg / 2;

// Calculando a posição Y inicial para que o menu inteiro fique centralizado verticalmente
var total_altura_menu = menu_itens * item_altura; // Altura total ocupada pelas opções do menu
var pos_y_inicial = (gui_alt / 2) - (total_altura_menu / 2); // Centralizando verticalmente

// Desenhando as opções do menu
for (var _i = 0; _i < menu_itens; _i++)
{
    var desvio_texto = 2; // Deslocamento da sombra do texto
    var _texto = menu_inicial[_i];
    var _cor = c_gray;
    var escala = 1; // Escala padrão para itens não selecionados

    // Verificar se a opção atual está selecionada
    if (menu_selecao == _i)
    {
        _cor = c_white; // Mudar a cor do texto selecionado para branco
        escala = 1.5;   // Aumentar a escala para a opção selecionada
    }

    // Calcular a posição Y para o item atual, com base na posição inicial centralizada
    var yy = pos_y_inicial + (_i * item_altura); // Posiciona cada item do menu verticalmente

    // Desenhar o texto com a escala apropriada e centralizado
    draw_set_color(c_black); // Cor da sombra do texto
    draw_text_transformed(menu_x - desvio_texto, yy, _texto, escala, escala, 0); // Sombra à esquerda
    draw_text_transformed(menu_x + desvio_texto, yy, _texto, escala, escala, 0); // Sombra à direita
    draw_text_transformed(menu_x, yy + desvio_texto, _texto, escala, escala, 0); // Sombra abaixo
    draw_text_transformed(menu_x, yy - desvio_texto, _texto, escala, escala, 0); // Sombra acima

    draw_set_color(_cor); // Cor do texto
    draw_text_transformed(menu_x, yy, _texto, escala, escala, 0); // Texto principal
}

// Reinicia o alinhamento e a fonte após desenhar
draw_set_halign(fa_left); // Retorna para alinhamento padrão
draw_set_valign(fa_top);   // Retorna para alinhamento padrão
