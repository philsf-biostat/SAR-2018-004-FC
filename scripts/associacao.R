source("scripts/input.R", encoding = 'UTF-8')

# POS_DISFONIA ####
# tabelas
ob.disfon <- with(DF, table(OBESO, POS_DISFONIA))
cir.disfon <- with(DF, table(LONGA, POS_DISFONIA))
corpec.disfon <- with(DF, table(CORPECTOMIAS, POS_DISFONIA))
mielo.disfon <- with(DF, table(MIELOPATIA, POS_DISFONIA))
frat.disfon <- with(DF, table(`FRATURA / SEQUELA`, POS_DISFONIA))
gen.disfon <- with(DF, table(GENERO, POS_DISFONIA))
niveis.disfon <- with(DF, table(NIVEIS, POS_DISFONIA))
placa.disfon <- with(DF, table(PLACA, POS_DISFONIA))
cervic.disfon <- with(DF, table(`CERVICAL ALTA`, POS_DISFONIA))

# DISFAGIA ####
# tabelas
ob.disfag <- with(DF, table(OBESO, DISFAGIA))
cir.disfag <- with(DF, table(LONGA, DISFAGIA))
corpec.disfag <- with(DF, table(CORPECTOMIAS, DISFAGIA))
mielo.disfag <- with(DF, table(MIELOPATIA, DISFAGIA))
frat.disfag <- with(DF, table(`FRATURA / SEQUELA`, DISFAGIA))
gen.disfag <- with(DF, table(GENERO, DISFAGIA))
niveis.disfag <- with(DF, table(NIVEIS, DISFAGIA))
placa.disfag <- with(DF, table(PLACA, DISFAGIA))
cervic.disfag <- with(DF, table(`CERVICAL ALTA`, DISFAGIA))

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
