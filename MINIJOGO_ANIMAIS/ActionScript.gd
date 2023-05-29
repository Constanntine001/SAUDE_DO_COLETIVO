extends Node

#[REFERÊNCIAS GERAIS]

# Salva o node de movimento pra executar movimentos com o gatinho
@onready var MovementScript : Node = get_parent().get_node("MovementScript")

#[==========================]

#[Ação Movimento Aleatório]

"""
	Funções que fazem o gatinho ter o movimento aleatório
	(estado padrão dele)
"""

func MovimentoAleatorio():
	MovementScript.MoveGato(MovementScript.PegaPosicaoAleatoria())

#[==========================]

#[Ação Brincar com Ratinho no Chão]

"""
	Essa ação acontece quando o jogador coloca o ratinho
	no chão
"""

func BrincarRatoChao():
	var brinquedoRato = get_tree().get_nodes_in_group("brinquedo_rato")[0]
	
	await MovementScript.MoveGato(brinquedoRato.global_position)
	brinquedoRato.queue_free()

#[==========================]

#[Ação Brincar com Ratinho no Ar(wave)]

"""
	Essa ação acontece quando o jogador usa o ratinho
	no ar
"""

func BrincarRatoWave():
	var brinquedoRato = get_tree().get_nodes_in_group("area_wave")[0]
	
	await MovementScript.MoveGato(brinquedoRato.global_position)
	brinquedoRato.queue_free()

#[==========================]

#[Handler de Ações]

"""
	Handler que coordena quais ações o pepino vai tomar,
	por exemplo comer, andar, se esconder, brincar e etc.
"""

@export var proximaAcao : PepinoActions
@export var tempoEsperaAcoes : Vector2 = Vector2(3, 7)

enum PepinoActions {MovimentoAleatorio, BrincarRatoChao, BrincarRatoWave}
var pepinoAcaoAtual = PepinoActions.MovimentoAleatorio

func _HandlerAcoes():
	if(get_tree().get_nodes_in_group("brinquedo_rato").size() > 0):
		pepinoAcaoAtual = PepinoActions.BrincarRatoChao
	elif(get_tree().get_nodes_in_group("area_wave").size() > 0):
		pepinoAcaoAtual = PepinoActions.BrincarRatoWave
	else:
		pepinoAcaoAtual = PepinoActions.MovimentoAleatorio

	ExecutaAcaoAtual()
	
	await get_tree().create_timer(randi_range(tempoEsperaAcoes.x, tempoEsperaAcoes.y)).timeout
	_HandlerAcoes()
			
func ExecutaAcaoAtual():
	match pepinoAcaoAtual:
		PepinoActions.MovimentoAleatorio:
			MovimentoAleatorio()
		PepinoActions.BrincarRatoWave:
			BrincarRatoWave()
		PepinoActions.BrincarRatoChao:
			BrincarRatoChao()
			

#[==========================]	

func _ready():
	_HandlerAcoes() # Dá a primeira carga no Handler de Acoes
	pass




