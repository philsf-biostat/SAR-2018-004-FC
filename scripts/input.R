library(readxl)
library(data.table)

rm(list = ls())

DF <- read_excel("dataset/brutos/Tabela Dados.xlsx", 2, skip = 1)
DF <- data.table(DF)

DF <- DF[,.(PRONTUÁRIO,
      GENERO,
      IDADE,
      `CERVICAL ALTA`,
      PLACA,
      NIVEIS,
      CORPECTOMIAS,
      MIELOPATIA,
      `DURAÇÃO CIR`,
      `FRATURA / SEQUELA`,
      PESO,
      ALTURA = ALTURA/100,
      IMC,
      DISFONIA,
      DISFAGIA
      )]

DF$NIVEIS <- factor(DF$NIVEIS)
DF$CORPECTOMIAS <- factor(DF$CORPECTOMIAS)
DF$DISFAGIA <- factor(DF$DISFAGIA)
DF$DISFONIA <- factor(DF$DISFONIA)
DF$`FRATURA / SEQUELA` <- factor(DF$`FRATURA / SEQUELA`)
DF$MIELOPATIA <- factor(DF$MIELOPATIA)
DF$`CERVICAL ALTA` <- factor(DF$`CERVICAL ALTA`)
DF$PLACA <- factor(DF$PLACA)
DF$GENERO <- factor(DF$GENERO)
DF$PRONTUÁRIO <- factor(DF$PRONTUÁRIO)
DF$IMC <- DF[,.(PESO/(ALTURA^2))]
DF$OBESO <- cut(DF$IMC, breaks = c(0,30, Inf), labels = c(0, 1))
DF$DURACAO <- DF[, .( hour(`DURAÇÃO CIR`)*60 + minute(`DURAÇÃO CIR`) ) ]

DF$DUR.cat <- DF[, .( factor(hour(`DURAÇÃO CIR`)))]
LONGA <- cut(hour(DF$`DURAÇÃO CIR`), breaks = c(0,2, Inf), labels = c(0, 1))
levels(DF$NIVEIS) <-  c("Até 2", "Até 2", "3 ou mais", "3 ou mais")
levels(DF$CORPECTOMIAS) <- c(0, 1, 1)

pos_tardio <- read_excel("dataset/Tabela Dados SEGUNDA ETAPA PARA FELIPE.xlsx",
                         sheet = "Pos Tardio", skip = 1)
pos_tardio <- data.table(pos_tardio[, c(3,5:6)])
pos_tardio$PRONTUÁRIO <- factor(pos_tardio$PRONTUÁRIO)
names(pos_tardio) <- c("PRONTUÁRIO", "POS_DISFONIA", "POS_DISFAGIA")

DF_pos <- pos_tardio[DF, , on = .(PRONTUÁRIO)]
DF_pos <- DF_pos[!is.na(POS_DISFONIA) & !is.na(POS_DISFAGIA)]
