templatesOFB

Ce pakage met à disposition un ensemble d'éléments répondant à la charte graphique de l'OFB: couleurs, themes ggplot, modèle de tableau de bord shiny...

Il peut être installé depuis le Gitlab de l'OFB:

```r
if (!require(remotes))
    install.packages("remotes")

remotes::install_gitlab(
    repo = "cedric.mondy1/templatesofb",
    host = "https://gitlab.ofb.fr", 
    dependencies = TRUE
    )

```
