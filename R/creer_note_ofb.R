#' Créer une note OFB
#'
#' Cette fonction permet de créer un fichier [Quarto](https://quarto.org/) permettant de générer une note au format word selon le modèle de l'OFB.
#'
#' @param nom nom du fichier Quarto/Word à créer
#' @param dossier dossier où les fichiers seront crées
#'
#' @export
#'
creer_note_ofb <- function(nom, dossier = getwd()) {
    file.copy(
        from = system.file("templates/note_ofb.qmd", package = "templatesOFB"),
        to = file.path(dossier, paste0(nom, ".qmd"))
        )
    file.copy(
        from = system.file("templates/template_note_ofb.docx", package = "templatesOFB"),
        to = file.path(dossier, "template_note_ofb.docx")
    )

    rstudioapi::navigateToFile(
        file = file.path(dossier, paste0(nom, ".qmd"))
    )
}
