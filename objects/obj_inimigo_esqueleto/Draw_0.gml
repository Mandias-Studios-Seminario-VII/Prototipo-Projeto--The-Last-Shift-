// Inherit the parent event
event_inherited();

// Desenhando uma linha para ver se a distancia de visão está funcionando
draw_line(x, y - sprite_height/4, x + (dist_visao * xscale), y - sprite_height/4)
