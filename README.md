# seidatalab <a href='https://seidatalab.github.io/'><img src="https://raw.githubusercontent.com/jonates/seidatalab/main/seidatalab_hexagonal_stick.png" align="right" width="120.216" height="139"/></a>

Este pacote contém funções úteis para rotina de trabalho do SEIDataLab - Laboratório de dados da SEI.

Atualmente disponibiliza 1 conjuntos de dados:

1.  `data_ncm`
1.  `data_gtin`

O `data_ncm` um conjunto de dados com alguns ncm, com tamanhos corretos (8 dígitos) e também alguns com quantidade de dígitos errados.

O `data_gtin` um conjunto de dados com alguns ncm, com tamanhos corretos (8 dígitos) e também alguns com quantidade de dígitos errados.

O `ideb_fundamental_finais_brasil` contem como atributo os valores dos indicadores utilizados para o calculo do IDEB das séries finais (6º ao 9º ano) do ensino fundamental para o Brasil, como as taxas de aprovacoes (por serie) e as notas da prova SAEB. Conta tambem com o valor do IDEB e as metas para os anos de 2005, 2007, 2009, 2013, 2015, 2017 e 2019. Tambem estratifica essas informacoes pela rede de ensino.

## Instalacao

``` {.r}
#Instale o pacote devtoools caso ainda não tenha instalado
#install.packages(devtools)

#instala o pacote idebr
devtools::install_github("jonates/seidatalab")
```
## Instalacao
Apos a instalacao do pacote `seidatalab` para carregar um conjunto de dados basta digitar no script `seidatalab::data_ncm`. Caso esteja no RStudio, basta digitar `seidatalab::` e apertar a tecla `tab` que o autocompletar do RStudio vai mostrar todos os conjuntos de dados disponiveis no pacote `idebr` para que voce possa escolher.

## Exemplo 1

``` {.r}
#carrega a base do ideb do ensino médio do Brasil
df <- idebr::ideb_ensino_medio_brasil

#Plot o gráfico do IDEB do Brasil, por ano e por rede de ensino.
library(ggplot2)
ggplot(data = df) +
  geom_point(aes(x=ano,y=ideb,colour=rede))
```
<img src="https://raw.githubusercontent.com/jonates/idebr/main/diagrama_dispersao_Brasil_EM.png"/>


``` {.r}
```

## Roadmap

Estrato    | Fundamental - iniciais | Fundamental - finais | Ensino Medio             |
---------- | :--------------------: | :------------------: | :----------:
Brasil     | :heavy\_check\_mark: | :heavy\_check\_mark: | :heavy\_check\_mark:
Regioes    | - | - | -
UF         | - | - | -
Municipios | - | - | -
Escolas    | :heavy\_check\_mark: | :heavy\_check\_mark: | :heavy\_check\_mark:

