ofb_colors <- c(
    bleu1 = "#003A76",
    bleu2 = "#0083CB",
    bleu3 = "#00A6E2",
    bleu4 = "#5BC5F2",
    bleu5 = "#99D7F7",
    vert1 = "#0E823A",
    vert2 = "#A4A64B",
    vert3 = "#6AB96F",
    vert4 = "#9FCA7E",
    vert5 = "#C4DB9B",
    marron1 = "#564949",
    marron2 = "#9A7B67",
    marron3 = "#CC9F72",
    marron4 = "#EAC198",
    rouge = "#C2133E",
    orange1 = "#ED6A53",
    orange2 = "#F39655",
    jaune = "#FFD744"
)

ofb_palettes <- list(
    eau = ofb_colors[c("bleu1", "bleu2", "bleu3", "bleu4", "bleu5")],
    vegetal = ofb_colors[c("vert1", "vert2", "vert3", "vert4", "vert5")],
    terre = ofb_colors[c("marron1", "marron2", "marron3", "marron4")],
    terrestre = ofb_colors[c("vert1", "vert3", "vert5", "marron4", "marron2")],
    feu = ofb_colors[c("rouge", "orange1", "orange2", "jaune")],
    secheresse = ofb_colors[c("bleu2", "vert5", "marron4", "orange1", "rouge")],
    principale = ofb_colors[c("bleu1", "vert1", "jaune", "orange1", "rouge")],
    pastel = ofb_colors[c("bleu5", "vert5", "jaune", "orange2")]
)

usethis::use_data(ofb_colors, overwrite = TRUE)
usethis::use_data(ofb_palettes, overwrite = TRUE)
