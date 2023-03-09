#' Detectar os GTINs válidos
#' 
#' Recebe um vetor com o código Global Trade Item Number e retorna as observações adicionando uma coluna binária referente a validação, onde 0 = "Inválido" e 1 = "Válido".
#' 
#' @param data vetor de códigos gtin.
#' 
#' @param var nome da variável que corresponde ao gtin
#' 
#' @export
ver_char_gtin <- function(data, var)
{
  var_name <- base::as.name(base::substitute(var))
  if (sparklyr::sdf_schema(data[var])[[1]][2]$type == "StringType") {
    data <- dplyr::mutate(.data = data,
                          grepl_gtin = grepl("^0", {{var_name}}),
                          VALID_GTIN = dplyr::case_when(
                            (
                              (
                                nchar({{var_name}}) == 8 & {{var_name}} != "SEM GTIN") |
                                nchar({{var_name}}) == 12 |
                                nchar({{var_name}}) == 13 |
                                nchar({{var_name}}) == 14
                            ) & grepl_gtin == FALSE ~ 1,
                            TRUE ~ 0
                          ))
  } else {
    data <- dplyr::mutate(.data = data,
                          grepl_gtin = grepl("^0", as.character(as.integer({{var_name}}))),
                          VALID_GTIN = dplyr::case_when(
                            (
                              (
                                nchar(as.character(as.integer({{var_name}}))) == 8 & {{var_name}} != "SEM GTIN") |
                                nchar(as.character(as.integer({{var_name}}))) == 12 |
                                nchar(as.character(as.integer({{var_name}}))) == 13 |
                                nchar(as.character(as.integer({{var_name}}))) == 14
                            ) & grepl_gtin == FALSE ~ 1,
                            TRUE ~ 0
                          ))
  }
  # data <- dplyr::select(.data = data,
  #                       -c(grepl_gtin))
  data <- dplyr::relocate(.data = dplyr::select(.data = data,
                                                -c(grepl_gtin)),
                          VALID_GTIN, .after = gtin)
  return(data)
}
