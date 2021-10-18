library(haven)
library(tidyverse)
library(knitr)
library(stargazer)
library(broom)
library(jtools)
library(interactions)
library(interflex)
library(coefplot)
library(tidyverse)

bpsrt <- read_stata("banco_BPSR_final.dta")
View(bpsrt)

bi_reg <- bpsrt %>%
  lm(votos_cand_qe ~ Dummy_cor, data=.)

bi_reg

bi_reg_log <- bpsrt %>%
  lm(votos_cand_qe_ln ~ Dummy_cor, data = .)

bi_reg_log

multi_model <- bpsrt %>%
  lm(votos_cand_qe ~Dummy_cor + Dummy_sexo + Dummy_EnsSuperior +
       Dummy_Classe + reeleicao + despesa_proc, data = .)

multi_model

multi_model_log <- bpsrt %>%
  lm(votos_cand_qe_ln ~Dummy_cor + Dummy_sexo + Dummy_EnsSuperior +
       Dummy_Classe + reeleicao + despesa_proc_ln, data = .)

multi_model_log
