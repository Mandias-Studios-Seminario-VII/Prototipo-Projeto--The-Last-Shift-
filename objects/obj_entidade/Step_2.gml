// Sistema de colisão e movimentação horizontal
repeat(abs(velh))
{
	var _velh = sign(velh);
	
	// Fazendo o jogador subir uma rampa
	// Checando se o jogador está colidindo com algum objeto E 
	// se na direção de cima esta livre (se não ha colisão)
	if (place_meeting(x + _velh, y, obj_chao) && 
		!place_meeting(x + _velh, y - 1, obj_chao)) 
	{
			// Fazendo o jogador subir 1 pixel
			y--;
	}
	
	// Subindo rampas ou plataformas de 2 degraus
	// Verificando a frente do jogador ou inimigo
	// Verificando se ha colisão a frente e em cima da posição do jogador ou inimigo
	// Verificando se NÃO ha colisão a frente e 2 espaços acima
	/* if (!place_meeting(x + _velh, y, obj_chao) && 
		!place_meeting(x + _velh, y - 1, obj_chao) && 
		place_meeting(x + _velh, y - 2, obj_chao))
	{
		y -= 2;
	} */
	
	// Fazendo descer uma rampa
	// Checando se NÃO estou colidindo
	// Verificando se na frente e abaixo está livre (sem colisão) E
	// Se dois degraus abaixo está ocupado (tem colisão)
	if (!place_meeting(x + _velh, y, obj_chao) && 
		!place_meeting(x + _velh, y + 1, obj_chao) && 
		place_meeting(x + _velh, y + 2, obj_chao))
	{
		y++;
	}
	
	
	// Checando se estou está colidindo com algum objeto
	if (place_meeting(x + _velh, y, obj_chao))
	{
		// Quando estiver para se colidir ele para
		velh = 0;
		// Saindo do laço
		break;
	} else // Caso o jogador ou inimigo não esteja colidindo com um obstaculo
	{
		// O jogador ou inimigo pode se mover um pixel por vez caso não esteja colidindo
		x += _velh;
	}	
}


// Sistema de colisão vertical
repeat(abs(velv))
{
	var _velv = sign(velv);
	if (place_meeting(x, y + _velv, obj_chao))
	{
		velv = 0;
		break;
	} else
	{
		y += _velv;
	}
}
