#' Detectar os NCMs válidos
#' 
#' Recebe um vetor com o código da Nomenclatura Comum do Mercosul e retorna os valores únicos adicionando uma coluna binária referente a validação, onde 0 = "Inválido" e 1 = "Válido".
#' 
#' @param data vetor de códigos ncm.
#' 
#' @export
ver_char_ncm <- function (data, var) {
  data <- as.data.frame(dplyr::distinct(data[var]))
  data <- mutate(data,
                 VALID_NCM = dplyr::case_when(nchar(trimws(data[,1])) == 8 ~ 1,
                                              TRUE ~ 0))
  return(data)
  }
