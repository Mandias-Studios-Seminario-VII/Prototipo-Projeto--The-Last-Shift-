/// @desc tecla virtual botão som
// O botão som Ativa/Desativa o audio do jogo
global.botao_efeitos_sonoros = virtual_key_add(864, 384, 100, 100, ord("T"));

global.efeitos_ativos = true;

spr_efeitos_ativos = spr_vk_efeito_sonoro;
spr_efeitos_desativados = spr_vk_efeito_desativado;
