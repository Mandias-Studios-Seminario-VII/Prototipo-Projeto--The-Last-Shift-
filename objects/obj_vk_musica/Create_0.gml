/// @desc Evento create do botão de desativar musica
global.botao_musica = virtual_key_add(864, 608, 100, 100, ord("Y"));

global.musica_ativa = true;

spr_efeitos_ativos = spr_vk_musica;
spr_efeitos_desativados = spr_vk_musica_desativada;
