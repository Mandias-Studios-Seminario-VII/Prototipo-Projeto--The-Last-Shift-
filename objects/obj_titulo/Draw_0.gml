/// @desc Ajustando a posição do título do jogo com sombreamento

// Fonte do título
draw_set_font(fnt_titulo);

// Texto do título
var titulo_texto = "THE LAST SHIFT"; // Substitua pelo nome do seu jogo

// Calcula a posição horizontal ao centro da tela
var pos_x = display_get_width() / 2 - string_width(titulo_texto) / 2;
var pos_y = 80; // Valor para ajustar a posição ao eixo y (ajuste conforme necessário)

// Desenha a sombra
draw_set_color(#5CC2FA); // Cor da sombra do texto
draw_text(pos_x + 4, pos_y + 4, titulo_texto); // Deslocamento para a sombra

// Desenha o título principal
draw_set_color(#FCFFFF); // Cor principal do texto
draw_text(pos_x, pos_y, titulo_texto);
