#' Detectar os NCMs válidos
#' 
#' Recebe um vetor com o código da Nomenclatura Comum do Mercosul e retorna os valores únicos adicionando uma coluna binária referente a validação, onde 0 = "Inválido" e 1 = "Válido".
#' 
#' @param data vetor Spark de códigos ncm.
#' 
#' @param var Nome da variável de interesse.
#' 
#' @param rep_valida Vetor com os códigos NCM válidos.
#' 
#' @export
ver_char_ncm <- function (data, var, rep_valida) {
  var_name <- base::as.name(base::substitute(var))
  if (sparklyr::sdf_schema(data[var])[[1]][2]$type == "StringType") {
    data <- dplyr::mutate(data, 
                          VALID_NCM = dplyr::case_when(nchar(trimws({{var_name}})) == 8 &
                                                         trimws({{var_name}}) %in% !!rep_valida ~ 1,
                                                       TRUE ~ 0))
  } else {
    data <- dplyr::mutate(data, 
                          VALID_NCM = dplyr::case_when(nchar(as.character(as.integer({{var_name}}))) == 8 &
                                                         as.character(as.integer({{var_name}})) %in% !!rep_valida ~ 1,
                                                       TRUE ~ 0))
  }
  
  data <- dplyr::relocate(.data = data, VALID_NCM, .after = dplyr::all_of(var_name))
  return(data)
  }
