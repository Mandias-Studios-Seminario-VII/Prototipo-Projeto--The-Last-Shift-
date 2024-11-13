// Atualiza a posição do texto para rolar para cima, com um valor de deslocamento fixo
y_texto -= velocidade;

// Verifica se o texto saiu da tela (passou do topo)
var final_eixo_y = y_texto + (espacamento * array_length(creditos) * 2);
if (final_eixo_y < 0) {
    room_goto(rm_menu_inicial); // Vai para a room do menu inicial
}
