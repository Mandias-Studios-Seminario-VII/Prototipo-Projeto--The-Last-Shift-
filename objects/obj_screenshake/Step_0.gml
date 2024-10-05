/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Fazendo a tela do jogo ter um tremor leve ao causar dano
view_xport[0] = random_range(-shake, shake);
view_yport[0] = random_range(-shake, shake);

// Diminuindo o valor do tremor de tela
shake *= .9;

// Destruindo o tremor de tela
if (shake <= .2)
{
	instance_destroy();
}