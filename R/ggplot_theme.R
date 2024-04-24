#' Thème ggplot OFB
#'
#' Ce thème permet d'appliquer un visuel conforme à la charte graphique de l'OFB
#' à un graphique obtenu avec le package \{ggplot2\}
#'
#' @param base_size taille de la police utilisée (en points)
#' @param base_family type de police à utiliser
#'
#' @export
#'
#' @examples \dontrun{
#' gg <- data.frame(
#'         x = rnorm(100),
#'         y = rnorm(100),
#'         c = sample(c("a", "b", "c"), size = 100, replace = TRUE),
#'         d = rnorm(100)
#'       ) %>%
#'     ggplot2::ggplot() +
#'     ggplot2::geom_point(ggplot2::aes(x = x, y = y, colour = c, size = d)) +
#'     ggplot2::labs(title = "titre", subtitle = "sous-titre")
#'
#' gg
#' gg + theme_ofb()
#' }
#'
#' @importFrom ggplot2 theme_minimal theme element_blank element_text margin
#'   element_line '%+replace%'
theme_ofb <- function(base_size = 11, base_family = "") {

    ggplot2::theme_minimal(
        base_size = base_size,
        base_family = base_family,
        base_line_size = base_size/22,
        base_rect_size = base_size/22
    ) %+replace%
        ggplot2::theme(
            panel.background = ggplot2::element_blank(),
            panel.grid = ggplot2::element_blank(),
            plot.title = ggplot2::element_text(
                face = "bold",
                color = ofb_cols("bleu1"),
                size = base_size*1.8,
                hjust = 0,
                vjust = 4,
                margin = ggplot2::margin(10)
            ),
            plot.subtitle = ggplot2::element_text(
                face = "bold",
                color = ofb_cols("bleu1"),
                size = base_size*1.45,
                hjust = 0,
                vjust = 4
            ),
            plot.caption = ggplot2::element_text(
                size = base_size * .75,
                hjust = 0
            ),
            plot.title.position = "plot",
            axis.line = ggplot2::element_line(
                color = ofb_cols("marron1")
            ),
            axis.ticks = ggplot2::element_line(
                color = ofb_cols("marron1")
            ),
            axis.text = ggplot2::element_text(
                color = ofb_cols("marron1"),
                size = base_size*.9
            ),
            axis.title.x = ggplot2::element_text(
                face = "italic",
                color = ofb_cols("marron1"),
                hjust = 1,
                vjust = -1,
                size = base_size*1.1
            ),
            axis.title.y = ggplot2::element_text(
                face = "italic",
                color = ofb_cols("marron1"),
                angle = 90,
                vjust = 2,
                hjust = 0,
                size = base_size*1.1
            ),
            legend.title = ggplot2::element_text(
                size = base_size*1.1
            ),
            legend.text = ggplot2::element_text(
                size = base_size*.9
            ),
            legend.justification = "top",
            legend.box.just = "left",
            legend.text.align = 0,
            legend.title.align = 0
        )
}

