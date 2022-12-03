extends Node

var nomeJogador = "Robinho" # Jogador vai selecionar o proprio nome no ínicio do game
var tipoSprite = true # Se o Jogador selecionou o tipo de player A ou B

var LastPlayerPos : Vector2

enum TipoObjetivo {intro_animais, animais, animais_nutricao, nutricao, nutricao_livre, livre} # Lista de objetivos do jogo
var objetivo = TipoObjetivo.intro_animais

func ProxObjetivo():
	objetivo += 1
	pass

func FinalizaFala():
	# Caso a fala não for uma fala de Loop aumenta para entrar na fala de loop	
	if !(objetivo == 1 || objetivo == 3 || objetivo == 5):
		objetivo += 1
		
func _ready():
	print(objetivo)
