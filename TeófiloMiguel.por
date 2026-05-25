//Teófilo Miguel Peçanha Leal
programa {

	funcao mostrarJogo(caracter jogo[][]){
		inteiro i,j

		para(i = 0; i < 3; i++){
			para(j = 0; j < 3; j++){
				escreva("[", jogo[i][j], "]")
			}
			escreva("\n")
		}
	}

	funcao caracter verificar(caracter jogo[][]){
		inteiro i
		para(i = 0; i < 3; i++){
			se(jogo[i][0] == jogo[i][1] e jogo[i][1] == jogo[i][2] e jogo[i][0] != ' '){
				retorne jogo[i][0]
			}
			se(jogo[0][i] == jogo[1][i] e jogo[1][i] == jogo[2][i] e jogo[0][i] != ' '){
				retorne jogo[0][i]
			}
		}
		se(jogo[0][0] == jogo[1][1] e jogo[1][1] == jogo[2][2] e jogo[0][0] != ' '){
			retorne jogo[0][0]
		}
		se(jogo[0][2] == jogo[1][1] e jogo[1][1] == jogo[2][0] e jogo[0][2] != ' '){
			retorne jogo[0][2]
		}
		retorne ' '
	}
	funcao jogar(inteiro &x, inteiro &o, inteiro &velhas, inteiro &partidas){
		caracter jogo[3][3]
		inteiro i, j, linha, coluna, jogadas = 0
		caracter jogador = 'X'
		caracter vencedor = ' '

		para(i = 0; i < 3; i++){
			para(j = 0; j < 3; j++){
				jogo[i][j] = ' '
			}
		}

		enquanto(jogadas < 9 e vencedor == ' '){
			mostrarJogo(jogo)
			escreva("Jogador ", jogador, "\n")
			escreva("Linha: ")
			leia(linha)
			escreva("Coluna: ")
			leia(coluna)

			se(jogo[linha][coluna] == ' '){
				jogo[linha][coluna] = jogador
				jogadas = jogadas + 1
				vencedor = verificar(jogo)
				se(jogador == 'X'){
					jogador = 'O'
				}
				senao{
					jogador = 'X'
				}
			}
		}

		mostrarJogo(jogo)
		partidas = partidas + 1
		se(vencedor == 'X'){
			escreva("X venceu\n")
			x = x + 1
		}
		senao{
			se(vencedor == 'O'){
				escreva("O venceu\n")
				o = o + 1
			}
			senao{
				escreva("Deu velha\n")
				velhas = velhas + 1
			}
		}
	}

	funcao inicio() {

		inteiro opcao = 0, partidas = 0, velhas = 0, o = 0, x = 0

		enquanto(opcao != 3){
			escreva("1-Jogar \n2-Mostrar Placar \n3-Sair")
			leia(opcao)
			se(opcao == 1){
				jogar(x, o, velhas, partidas)
			}
			se(opcao == 2){
				escreva("Vitorias X: ", x)
				escreva("\nVitorias O: ", o, "\n")
			}
		}

		escreva("Total de partidas: ", partidas)
		escreva("\nTotal de velhas: ", velhas, "\n")
	}
}