# d'après: https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

#' Récupérer les codes HEX des couleurs OFB
#'
#' @param ... nom des couleurs OFB ([ofb_colors]) à récupérer
#'
#' @return
#' @export
#'
ofb_cols <- function(...) {
    cols <- c(...)

    if (is.null(cols))
        return(templatesOFB::ofb_colors)

    templatesOFB::ofb_colors[cols]
}


#' Créer une fonction pour interpoler les couleurs des palettes OFB
#'
#'
#' @param palette nom de l'une des 8 palettes OFB ([ofb_palettes])
#' @param reverse valeur logique indiquant si les couleurs de la palette doivent
#'   être inversées
#' @param ... arguments supplémentaires à passer à [colorRampPalette()]
#'
#' @return
#' @export
#'
#' @importFrom grDevices colorRampPalette
ofb_pal <- function(palette = "principale", reverse = FALSE, ...) {
    pal <- templatesOFB::ofb_palettes[[palette]]

    if (reverse)
        pal <- rev(pal)

    grDevices::colorRampPalette(pal, ...)
}

#' Créer une fonction 'scale' pour les couleurs OFB
#'
#' @inheritParams ofb_pal
#' @param discrete valeur logique indiquant si les couleurs sont discrètes ou non
#' @param ... arguments supplémentaires à passer à [ggplot2::discrete_scale()] ou [ggplot2::scale_color_gradientn()]
#'
#' @return
#' @export
#'
#' @examples \dontrun{
#' data <- data.frame(
#'         x = rnorm(100),
#'         y = rnorm(100),
#'         c = sample(c("a", "b", "c"), size = 100, replace = TRUE),
#'         d = rnorm(100)
#'       )
#'
#' gg <- data %>%
#'     ggplot2::ggplot() +
#'     ggplot2::geom_point(ggplot2::aes(x = x, y = y, colour = d)) +
#'     ggplot2::labs(title = "titre", subtitle = "sous-titre")
#'
#' gg
#' gg +
#'   scale_color_ofb(palette = "feu", discrete = FALSE)
#'
#' gg2 <- data %>%
#'     ggplot2::ggplot() +
#'     ggplot2::geom_point(ggplot2::aes(x = x, y = y, colour = c)) +
#'     ggplot2::labs(title = "titre", subtitle = "sous-titre")
#'
#' gg2
#' gg2 +
#'   scale_color_ofb(palette = "terrestre")
#' }

#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_color_ofb <- function(palette = "principale", discrete = TRUE, reverse = FALSE, ...) {
    pal <- ofb_pal(palette = palette, reverse = reverse)

    if (discrete) {
        ggplot2::discrete_scale(
            "colour",
            paste0("ofb_", palette),
            palette = pal, ...
            )
    } else {
        ggplot2::scale_color_gradientn(colours = pal(256), ...)
    }
}

#' Créer une fonction 'scale' pour les couleurs de remplissage  OFB
#'
#' @inheritParams scale_color_ofb
#'
#' @return
#' @export
#'
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
scale_fill_ofb <- function(palette = "principale", discrete = TRUE, reverse = FALSE, ...) {
    pal <- ofb_pal(palette = palette, reverse = reverse)

    if (discrete) {
        ggplot2::discrete_scale(
            "fill",
            paste0("ofb_", palette),
            palette = pal,
            ...
        )
    } else {
        ggplot2::scale_fill_gradientn(colours = pal(256), ...)
    }
}
