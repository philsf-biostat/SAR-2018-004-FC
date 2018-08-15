library(tableone)
tabela.disfagia <- print(CreateTableOne(data = DF_pos, vars = c("IDADE", "IMC", "DURACAO", "Dias"), strata = "POS_DISFAGIA"), exact = T, printToggle = F)
tabela.disfonia <- print(CreateTableOne(data = DF_pos, vars = c("IDADE", "IMC", "DURACAO", "Dias"), strata = "POS_DISFONIA"), exact = T, printToggle = F)
