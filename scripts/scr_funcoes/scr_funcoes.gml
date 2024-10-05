// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

}


// Screenshake
///@function screenshake(valor_da_tremida)
///@arg _treme
function screenshake(_treme)
{
	var _shake = instance_create_layer(0, 0, layer, obj_screenshake);
	_shake.screenshake = _treme;
}