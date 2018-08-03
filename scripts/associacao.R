source("scripts/input.R", encoding = 'UTF-8')

# POS_DISFONIA ####
# tabelas
ob.disfon <- with(DF_pos, table(OBESO, POS_DISFONIA))
cir.disfon <- with(DF_pos, table(LONGA, POS_DISFONIA))
corpec.disfon <- with(DF_pos, table(CORPECTOMIAS, POS_DISFONIA))
mielo.disfon <- with(DF_pos, table(MIELOPATIA, POS_DISFONIA))
frat.disfon <- with(DF_pos, table(`FRATURA / SEQUELA`, POS_DISFONIA))
gen.disfon <- with(DF_pos, table(GENERO, POS_DISFONIA))
niveis.disfon <- with(DF_pos, table(NIVEIS, POS_DISFONIA))
placa.disfon <- with(DF_pos, table(PLACA, POS_DISFONIA))
cervic.disfon <- with(DF_pos, table(`CERVICAL ALTA`, POS_DISFONIA))

# DISFAGIA ####
# tabelas
ob.disfag <- with(DF_pos, table(OBESO, POS_DISFAGIA))
cir.disfag <- with(DF_pos, table(LONGA, POS_DISFAGIA))
corpec.disfag <- with(DF_pos, table(CORPECTOMIAS, POS_DISFAGIA))
mielo.disfag <- with(DF_pos, table(MIELOPATIA, POS_DISFAGIA))
frat.disfag <- with(DF_pos, table(`FRATURA / SEQUELA`, POS_DISFAGIA))
gen.disfag <- with(DF_pos, table(GENERO, POS_DISFAGIA))
niveis.disfag <- with(DF_pos, table(NIVEIS, POS_DISFAGIA))
placa.disfag <- with(DF_pos, table(PLACA, POS_DISFAGIA))
cervic.disfag <- with(DF_pos, table(`CERVICAL ALTA`, POS_DISFAGIA))

# Função
format.or <- function(ctable) {
  stopifnot(is.table(ctable))
  stopifnot(dim(ctable) == c(2,2))
  fisher <- fisher.test(ctable)
  est <- round(fisher$estimate, digits = 1)
  ci <- round(fisher$conf.int, digits = 1)
  output <- paste0("OR: ", format(est), "; IC 95%: [",
                  format(ci[1]), ", ", 
                  format(ci[2]), "]")
  output
}
