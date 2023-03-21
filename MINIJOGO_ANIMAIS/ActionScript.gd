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
	await MovementScript.MoveGato(%BRINQUEDO_RATO.global_position)
	%BRINQUEDO_RATO.queue_free()

#[==========================]

#[Handler de Ações]

"""
	Handler que coordena quais ações o pepino vai tomar,
	por exemplo comer, andar, se esconder, brincar e etc.
"""

@export var proximaAcao : PepinoActions
@export var tempoEsperaAcoes : Vector2 = Vector2(3, 7)

enum PepinoActions {MovimentoAleatorio, BrincarRatoChao}
var pepinoAcaoAtual = PepinoActions.MovimentoAleatorio

func _HandlerAcoes():
	if(%BRINQUEDO_RATO != null):
		pepinoAcaoAtual = PepinoActions.BrincarRatoChao
	else:
		pepinoAcaoAtual = PepinoActions.MovimentoAleatorio

	ExecutaAcaoAtual()
	
	await get_tree().create_timer(randi_range(tempoEsperaAcoes.x, tempoEsperaAcoes.y)).timeout
	_HandlerAcoes()
			
func ExecutaAcaoAtual():
	match pepinoAcaoAtual:
		PepinoActions.MovimentoAleatorio:
			MovimentoAleatorio()
		PepinoActions.BrincarRatoChao:
			BrincarRatoChao()
			

#[==========================]	

func _ready():
	_HandlerAcoes() # Dá a primeira carga no Handler de Acoes
	pass




