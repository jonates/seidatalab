#' Detectar os NCMs válidos
#' 
#' Recebe um vetor com o código da Nomenclatura Comum do Mercosul e retorna as observações adicionando uma coluna binária referente a validação, onde 0 = "Inválido" e 1 = "Válido".
#' 
#' @param data vetor de códigos ncm.
#' 
#' @export
ver_char_ncm <- function(data) {
  if (sparklyr::sdf_schema(data)[[1]][2]$type == "StringType") {
    data <- dplyr::mutate(
      data,
      VALID_NCM = dplyr::case_when(
         nchar(glue::trim(ncm)) == 8 ~ 1,
         TRUE ~ 0
      )
    )
  } else {
      data <- dplyr::mutate(
        data,
        VALID_NCM = dplyr::case_when(
          nchar(as.character(as.integer(ncm))) == 8 ~ 1,
          TRUE ~ 0
        )
      )
    }
  return(data)
  }
