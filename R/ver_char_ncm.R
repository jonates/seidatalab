#' Detectar os NCMs válidos
#' 
#' Recebe um vetor com o código da Nomenclatura Comum do Mercosul e retorna as observações adicionando uma coluna binária referente a validação, onde 0 = "Inválido" e 1 = "Válido".
#' 
#' @param data vetor de códigos ncm.
#' 
#' @export
ver_char_ncm <- function(data, var) {
  if (sparklyr::sdf_schema(data)[[1]][2]$type == "StringType") {
    data <- dplyr::mutate(
      data,
      VALID_NCM = dplyr::case_when(
         nchar(glue::trim(data$var)) == 8 ~ 1,
         TRUE ~ as.character(data$var)
      )
    )
  } else {
      data <- dplyr::mutate(
        data,
        VALID_NCM = dplyr::case_when(
          nchar(as.character(as.integer(data$var))) == 8 ~ 1,
          TRUE ~ as.character(data$var)
        )
      )
    }
  return(data)
  }
