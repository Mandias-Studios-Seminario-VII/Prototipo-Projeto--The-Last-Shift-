ajuste_de_aspecto = function()
{	
	// Proporções base do jogo
	var _base_larg = 1920;
	var _base_alt = 1080;

	// Configurando o display e mantendo a superfície na resolução base
	display_set_gui_size(_base_larg, _base_alt);
	var _max_larg = display_get_width();
	var _max_alt = display_get_height();
	
	// Configurando o tamanho da câmera
	var _camera_larg = 1920;
	var _camera_alt = 1080;

	// Ajuste de aspecto para a câmera
	var _aspecto = _camera_larg / _camera_alt;
	
	if (_max_larg < _max_alt) {
		// Orientação retrato
		var _view_largura = min(_camera_larg, _max_alt);
		var _view_altura = _view_largura / _aspecto;
	} else {
		// Orientação paisagem
		var _view_altura = min(_camera_alt, _max_alt);
		var _view_largura = _view_altura * _aspecto;
	}
	
	// Ajustando a câmera para focar em 640x360
	camera_set_view_size(view_camera[0], _camera_larg, _camera_alt);

	// Ajustando o viewport para ocupar a tela inteira
	view_wport[0] = _max_larg;
	view_hport[0] = _max_alt;
	
	// Redimensionando a superfície para a resolução completa da tela
	surface_resize(application_surface, _max_larg, _max_alt);
}

// Chama a função para ajustar o aspecto
ajuste_de_aspecto();
