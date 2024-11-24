if (game_over)
{
    // Informações da câmera
    var _x01 = camera_get_view_x(view_camera[0]); 
    var _w = camera_get_view_width(view_camera[0]);
    var _x02 = _x01 + _w;
    var _meio_w = _x01 + _w / 2;
    var _y01 = camera_get_view_y(view_camera[0]);
    var _h = camera_get_view_height(view_camera[0]);
    var _y02 = _y01 + _h;
    var _meio_h = _y01 + _h / 2;
    
    var _qtd = _h * 0.15;
    val = lerp(val, 1, 0.01);

    // Tela escurecida
    draw_set_color(c_black);
    draw_set_alpha(val - 0.3);
    draw_rectangle(_x01, _y01, _x02, _y02, false);

    // Desenha o texto "VOCÊ MORREU"
    if (val >= 0.85)
    {
        timer_tela_gameover = lerp(timer_tela_gameover, 1, 0.01);

        draw_set_alpha(timer_tela_gameover);
        
        // Fonte maior para o título
        draw_set_font(fnt_gameover_titulo);
        draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        
        draw_set_color(c_red);  // Sombra
        draw_text(_meio_w + 1, _meio_h - 60 + 1, "VOCE MORREU");
        draw_set_color(c_white);  // Texto principal
        draw_text(_meio_w, _meio_h - 60, "VOCE MORREU");

        // Fonte menor para as opções
        draw_set_font(fnt_gameover_opcoes);
        var y_opcao = _meio_h + 30;  // Ajusta a posição abaixo do título
        
        // Tentar Novamente (à esquerda)
        draw_set_halign(fa_right);  // Alinhamento à direita para "Tentar Novamente"
        draw_set_color(opcao_selecionada == 0 ? c_yellow : c_white);
        draw_text(_meio_w - 60, y_opcao, "Tentar Novamente");

        // Sair (à direita)
        draw_set_halign(fa_left);  // Alinhamento à esquerda para "Sair"
        draw_set_color(opcao_selecionada == 1 ? c_yellow : c_white);
        draw_text(_meio_w + 60, y_opcao, "Sair");
    }

    // Restaura configurações padrão
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
