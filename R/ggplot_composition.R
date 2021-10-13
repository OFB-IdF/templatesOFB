#' Mise en page de graphiques ggplot
#'
#' Mise en page de graphiques obtenus avec \{ggplot2\}. La légende, la date
#' d'édition du graphique, les sources de données et le logo de l'OFB sont
#' placés à droite du graphique.
#'
#' @param gg un graphique obtenu avec le package \{ggplot2\}
#' @param src vecteur de texte, chaque élément correspondant à une source des
#'   données utilisées pour produire le graphique
#' @param src_size taille de la police à utiliser pour les sources de données
#' @param legend_dir sens dans lequel les (si plusieurs) légendes sont arrangées
#'   ("horizontal" ou "vertical")
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
#' compose_ofb(
#'     gg,
#'     src = c("OFB", "partenaires"),
#'     legend_dir = "horizontal"
#'   )
#' }
#' @importFrom ggplot2 theme element_rect ggplot annotate theme_void margin lims
#'   annotation_custom coord_cartesian
#' @importFrom ggpubr get_legend as_ggplot
#' @importFrom grid rasterGrob
#' @importFrom patchwork wrap_plots inset_element plot_spacer
compose_ofb <- function(gg, src = NULL, src_size = 2, legend_dir = "vertical") {

    gg_plot <- gg +
        ggplot2::theme(legend.position = "none")

    gg_legend <- (
        gg +
            ggplot2::theme(
                legend.key = ggplot2::element_rect(color = NA, fill = NA),
                legend.box = legend_dir,
                legend.justification = "top",
                legend.box.just = "left"
            )
    ) %>%
        ggpubr::get_legend() %>%
        ggpubr::as_ggplot()

    gg_sources <- ggplot2::ggplot() +
        ggplot2::annotate(
            "text",
            x = 0,
            y = 0,
            label = paste0(
                "EDITE LE: ", Sys.Date(),
                ifelse(
                    test = is.null(src),
                    yes = " ",
                    no = paste0(
                        "\nSource", ifelse(length(src) > 1, "s", ""), " des données:\n",
                        src %>%
                            # purrr::map_chr(stringr::str_wrap, width = 40, exdent = 6) %>%
                            paste0("    ", .) %>%
                            paste(collapse = "\n")

                    )
                )
            ),
            hjust = 0, vjust = 0, size = src_size
        ) +
        ggplot2::theme_void() +
        ggplot2::theme(
            plot.margin = ggplot2::margin(0)
        ) +
        ggplot2::lims(
            x = c(0, 60),
            y = c(0, 6)
        )

    gg_logo <- ggplot2::ggplot() +
        ggplot2::annotation_custom(
            grob = grid::rasterGrob(logo),
            xmin = 0,
            xmax = 837,
            ymin = 0,
            ymax = 288
        ) +
        ggplot2::coord_cartesian(
            xlim = c(0, 900),
            ylim = c(0, 350)
        ) +
        ggplot2::theme_void()

    patchwork::wrap_plots(
        gg_plot,
        patchwork::wrap_plots(
            gg_legend,
            gg_sources,
            patchwork::plot_spacer(),
            ncol = 1,
            heights = c(.45, .45, .1)
        ) +
            patchwork::inset_element(gg_logo,
                                     left = 0, right = 1,
                                     bottom = 0, top = 1,
                                     align_to = "full"),
        widths = c(.75, .25)
    )


}

