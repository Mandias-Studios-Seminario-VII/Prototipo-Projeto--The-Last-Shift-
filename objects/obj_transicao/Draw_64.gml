/// @desc Desenhando efeito visual de transição entre salas
image_alpha = 0;  // Define opacidade para garantir que o desenho não sobreponha outras imagens

if (modo != TRANS_MODO.OFF)
{
    draw_set_color(c_black);  // Cor preta para o efeito de transição

    // Desenha o retângulo superior
    draw_rectangle(0, 0, larg, porcentagem * alt_metade, false);

    // Desenha o retângulo inferior
    draw_rectangle(0, alt - (porcentagem * alt_metade), larg, alt, false);
}