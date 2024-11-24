// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function ScrgerenciadorVida(_vida_max) constructor{
	// Vida total do objeto
	vida_max = _vida_max;
	// Vida atual do objeto
	vida_atual = vida_max;
	vida_perda = vida_atual; // Efeito de perda gradual de vida
	fundo_vida = vida_atual // Barra de vida de fundo lenta
	
	// Metodo para perder vida (utilize vida_atual = gerenciador_vida.perde_vida)
	static perdendo_vida = function (_quantidade = 1)
	{
		vida_atual -= _quantidade;
		vida_atual = clamp(vida_atual, 0, vida_max); // Limita a vida para não ficar negativa ou utrapassar o limite
		return vida_atual;
	}
	
	// Metodo para ganhar vida se ouver algum caso
	static ganhando_vida = function (_quantidade = 1)
	{
		vida_atual += _quantidade;
		vida_atual = clamp(vida_atual, 0, vida_max);
		return vida_atual;
	}
	
	// Metodo para desenhar a barra de vida
	///@function desenhando_vida (x, y, largura, altura, [cor1], [cor2], [cor3]);
	static desenhando_vida = function(_x, _y, _largura, _altura, _cor1 = #b61111, _cor2 = #ffa944, _cor3 = #282626)
	{
		// Atualizando a largura da barra de vida de acordo com o valor atual
		var _larg_vida  = (vida_perda / vida_max) * _largura;
		var _larg_vida2 = (fundo_vida / vida_max) * _largura;
		
		var _cor = merge_color(_cor2, _cor1, vida_perda / vida_max);
		
		// Efeito de lentidão da quantidade de vida perdida
		vida_perda = lerp(vida_perda, vida_atual, 0.1);
		fundo_vida = lerp(fundo_vida, vida_perda, 0.03);
		
		// Desenhando uma barra sombreada atras da barra de vida normal
		draw_rectangle_color(_x - 2, _y - 2, _x + _largura + 2, _y + _altura + 2, _cor3, _cor3, _cor3, _cor3, false);
		
		// Desenhando a quantidade de vida perdida em uma cor diferente da padrão
		draw_rectangle_color(_x, _y, _x + _larg_vida2, _y + _altura, _cor2, _cor2, _cor2, _cor2, false);
		
		// Desenhando um retangulo para testar
		draw_rectangle_color(_x, _y, _x  + _larg_vida, _y + _altura, _cor, _cor, _cor, _cor, false);
	}

}
