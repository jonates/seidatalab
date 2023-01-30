# seidatalab <a href='https://seidatalab.github.io/'><img src="https://raw.githubusercontent.com/jonates/seidatalab/main/seidatalab_hexagonal_stick.png" align="right" width="120.216" height="139"/></a>

Este pacote contém funções úteis para rotina de trabalho do SEIDataLab - Laboratório de dados da SEI.

Atualmente disponibiliza 1 conjuntos de dados:

1.  `data_ncm`
1.  `data_gtin`

O `data_ncm` um conjunto de dados com alguns ncm, com tamanhos corretos (8 dígitos) e também alguns com quantidade de dígitos errados.

O `data_gtin` um conjunto de dados com alguns ncm, com tamanhos corretos (8 dígitos) e também alguns com quantidade de dígitos errados.

## Instalacao

``` {.r}
#Instale o pacote devtoools caso ainda não tenha instalado
#install.packages(devtools)

#instala o pacote idebr
devtools::install_github("jonates/seidatalab")
```
## Instalacao
Apos a instalacao do pacote `seidatalab` para carregar um conjunto de dados basta digitar no script `seidatalab::nomedodataset`. para chamar uma função basta digitar no script `seidatalab::nomedafuncao`. Caso esteja no RStudio, basta digitar `seidatalab::` e apertar a tecla `tab` que o autocompletar do RStudio vai mostrar todos os conjuntos de dados e as funções disponiveis no pacote `seidatalab` para que voce possa escolher.

## Exemplo 1

``` {.r}
#carrega a base do ideb do ensino médio do Brasil
df <- seidatalab::data_ncm

#Plot o gráfico do IDEB do Brasil, por ano e por rede de ensino.
library(ggplot2)
ggplot(data = df) +
  geom_point(aes(x=ano,y=ideb,colour=rede))
```
