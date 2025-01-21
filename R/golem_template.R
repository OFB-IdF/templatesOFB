#' Modèle OFB de tableau de bord Shiny
#'
#' Cette fonction permet de personnaliser les applis shiny créees à l'aide du
#' package \{golem\} pour générer un modèle de tableau de bord selon la charte
#' graphique de l'OFB
#'
#' @param path chemin du dossier où créer le package de l'appli
#' @param ... autres arguments passés à [golem::create_golem()]
#'
#' @examples \dontrun{
#' golem::create_golem(
#'       "TableauBord",
#'        project_hook = templates:golem_template
#'      )
#' }
#'
#' @seealso [golem::create_golem()]
#'
#' @importFrom brew brew
#' @export
golem_template <- function(path, ...) {

    golem::create_golem(path = path, ...)

    file.copy(
        from = system.file("templates/golem_template_ui.r",
                           package = "templatesOFB"),
        to = file.path(path, "R/app_ui.R"),
        overwrite = TRUE
    )

    file.copy(
        from = system.file(
            c(
                "templates/filigrane.png",
                "templates/logo.png",
                "templates/favicon.png",
                "templates/style.css"
                ),
            package = "templatesOFB"),
        to = file.path(path, "inst/app/www/"),
        overwrite = TRUE
    )

    file.copy(
        from = system.file(
            c(
                "templates/mod_selecteur.R"
            ),
            package = "templatesOFB"
        ),
        to = file.path(path, "R"),
        overwrite = TRUE
    )

    file.remove(file.path(path, "inst/app/www/favicon.ico"))

    brew::brew(
        file = system.file(
            "templates/app.brew",
            package = "templatesOFB"
        ),
        output = file.path(path, "app.R")
    )
}
