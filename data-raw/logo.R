logo <- png::readPNG(
    source = system.file(
        "templates/logo.png",
        package = "templatesOFB"
    )
)

usethis::use_data(logo, overwrite = TRUE)
