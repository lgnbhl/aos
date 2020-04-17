## Making a hex sticker for BFS
library(hexSticker)
library(magick)
library(magrittr)
library(showtext)

font_add_google("Open Sans")
## Automatically use showtext to render text
showtext_auto()

# ref: "https://upload.wikimedia.org/wikipedia/commons/d/df/Chevron_up_font_awesome.svg"
hexSticker::sticker("man/figures/empty_white.png", 
                    package = "AOS", 
                    p_color = "#5e72e4", 
                    p_family = "Open Sans",
                    p_size = 12,
                    p_y = 1,
                    spotlight = TRUE,
                    l_x = 1,
                    l_y = 1,
                    l_height = 4,
                    l_width = 4,
                    l_alpha = 0.3,
                    h_size = 1.5,
                    h_color = "#5e72e4",
                    h_fill = "white",
                    filename="man/figures/logo_large.png")

# MOD with Gimp: removing red borders.

aos <- magick::image_read("man/figures/logo_large.png")
magick::image_scale(aos, "130") %>%
  magick::image_write(path = "man/figures/logo.png", format = "png")

