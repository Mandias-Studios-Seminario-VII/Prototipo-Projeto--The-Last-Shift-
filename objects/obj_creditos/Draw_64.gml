/// @description Desenhando os creditos do jogo
var y_pos = y_texto; // Começa na posição inicial, garantindo que seja consistente

// Loop pelos itens da lista de créditos
for (var i = 0; i < array_length(creditos); i++) {
    // Verifica se é o título do jogo
    if (i == 0) {
        // Desenhando o título do jogo nos creditos
        draw_set_font(fnt_desenvolvedores);
        draw_set_color(#f19019); // Cor para o título do jogo
        draw_text(x_texto - string_width(creditos[i][0]) / 2, y_pos, creditos[i][0]);
        y_pos += espacamento * 2; // Espaçamento maior para o título
    } else {
        // Função na equipe de desenvolvimento
        draw_set_font(fnt_desenvolvedores);
        draw_set_color(#f19019); // Cor do texto de Funções da equipe
        draw_text(x_texto - string_width(creditos[i][0]) / 2, y_pos, creditos[i][0]);

        // Move para a posição abaixo para o nome
        y_pos += espacamento; // Controle do espaçamento

        // Nome do membro da equipe
        draw_set_font(fnt_nomes);
        draw_set_color(c_white); // Cor do texto dos nomes dos membros da equipe
        draw_text(x_texto - string_width(creditos[i][1]) / 2, y_pos, creditos[i][1]);

        // Ajusta a posição para o próximo par de função na equipe/nome do membro
        y_pos += espacamento * 2; // Mantém o espaçamento consistente
    }
}

// Restaura a cor ao final
draw_set_color(c_white);
