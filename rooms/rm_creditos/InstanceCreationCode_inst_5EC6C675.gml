// ajustando o aspecto da camera do jogo
ajuste_de_aspecto = function()
{	
	// Proporções base do jogo
	var _base_larg = 1920;
	var _base_alt = 1080;

	// Definido o tamanho do display
	display_set_gui_size(_base_larg, _base_alt);
	
	var _max_larg = display_get_width();
	var _max_alt = display_get_height();
	
	var _aspecto = _max_larg / _max_alt;
	
	// Verificando a orintação do dispositivo
	if (_max_larg < _max_alt)
	{
		var _view_largura = min(_base_larg, _max_alt);
		var _view_altura = _view_largura / _aspecto;
	}
	// Orientação deitada, paisagem
	else
	{
		var _view_altura = min(_base_alt, _max_alt);
		var _view_largura = _view_altura * _aspecto;
	}
	// Ajustando a camera e o viewport
	camera_set_view_size(view_camera[0], _view_largura, _view_altura);
	view_wport[0] = _max_larg;
	view_hport[0] = _max_alt;
	
	// Ajustando a superficie
	surface_resize(application_surface, _max_larg, _max_alt);
}

ajuste_de_aspecto();
