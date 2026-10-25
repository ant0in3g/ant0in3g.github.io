library(ggplot2)
library(gganimate)
library(scales)  # pour gradient_n_pal

# Séquence d'angles
theta <- seq(0, 2*pi, length.out = 1000)
n.values <- 0:20

# Création des données
df <- do.call(rbind, lapply(n.values, function(n) {
  rho <- 1 + cos(n*theta) + sin(n*theta)^2
  data.frame(
    theta = theta,
    n = n,
    x = rho * cos(theta),
    y = rho * sin(theta),
    step = seq_along(theta)
  )
}))

# Palette de verts (dégradé)
green_palette <- colorRampPalette(c("#a8e6a2", "#1b5e20"))(length(n.values))

# Graphique animé avec style "écolo"
p <- ggplot(df, aes(x, y, group = n, color = factor(n))) +
  geom_path(linewidth = 1.5) +
  scale_color_manual(values = green_palette) +
  coord_equal() +
  labs(title = expression(rho == 1 + cos(n*theta) + sin(n*theta)^2),
       subtitle = "n = {closest_state}",
       x = NULL, y = NULL) +
  theme_minimal(base_size = 16) +
  theme(
    plot.background = element_rect(fill = "#f0fff0", color = NA),  # fond vert très clair
    panel.background = element_rect(fill = "#f0fff0", color = NA),
    plot.title = element_text(hjust = 0.5, face = "bold", color = "#2e7d32"),
    plot.subtitle = element_text(hjust = 0.5, color = "#388e3c"),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    legend.position = "none"
  ) +
  transition_states(n, state_length = 2, transition_length = 2) +
  shadow_mark(past = TRUE, alpha = 0.15)

# Animation vidéo MP4 pour Instagram
animate(
  p,
  fps = 24,             # fluide
  nframes = 480,        # ~20s
  width = 1080,         # format carré
  height = 1080,
  renderer = av_renderer("courbe_polaire_instagram_vert.mp4")
)
