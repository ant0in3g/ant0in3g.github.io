# --- Chargement des librairies ---
library(ggplot2)
library(gganimate)
library(dplyr)
library(av)  # pour exporter en MP4

# --- Données de base ---
theta <- seq(0, 2*pi, length.out = 1000)
n_values <- seq(0, 10, by = 1)  # variation fluide de n

df <- expand.grid(theta = theta, n = n_values) %>%
  mutate(
    r = 2 + 3*sin(4*theta*n),
    x = r*cos(theta),
    y = r*sin(theta),
    color_val = sin(n/2)   # pour un effet de couleur dynamique
  )

# --- Graphique ---
p <- ggplot(df, aes(x, y, group = n, color = color_val)) +
  geom_path(linewidth = 1.5, alpha = 0.9) +
  scale_color_viridis_c(option = "plasma") +
  coord_equal() +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "black", color = NA),
    legend.position = "none",
    plot.title = element_text(color = "white", size = 20, face = "bold")
  ) +
  transition_time(n) +
  ease_aes('linear')

# --- Animation MP4 (haute qualité) ---
anim <- animate(
  p,
  fps = 30,          # fluidité
  nframes = 600,     # durée ~10 s
  width = 1080,      # HD
  height = 1080,
  res = 150,         # DPI
  renderer = av_renderer("courbe_polaire_HD.mp4")
)


