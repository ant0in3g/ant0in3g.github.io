library(ggplot2)
library(gganimate)
library(dplyr)
library(viridis)
library(av)

theta <- seq(0, 2*pi, length.out = 1000)
n_values <- seq(1, 20, by = 1)

df <- expand.grid(theta = theta, n = n_values) %>%
  mutate(
    r = 1 + cos(theta) + sin(n*theta)^2,
    x = r*cos(theta),
    y = r*sin(theta),
    color_val = sin(4*theta*n + n/2)
  )

df$n <- as.numeric(df$n)  # ✅ important pour gganimate

p <- ggplot(df, aes(x, y, group = n, color = color_val)) +
  geom_rect(aes(xmin=-6, xmax=6, ymin=-6, ymax=6), fill="aliceblue", color=NA) +  # fond fixe
  geom_path(linewidth = 2, alpha = 0.85) +
  scale_color_viridis_c(option = "plasma") +
  coord_equal() +
  theme_void() +
  theme(legend.position = "none",
        plot.title = element_text(size = 22, face = "bold", color = "black")) +
  labs(title = "Équation polaire : r = 2 + 3 sin(4θn)",
       subtitle = "n = {frame_time}") +
  transition_time(n) +
  ease_aes('linear')

# --- Animation MP4 ---
animate(
  p,
  fps = 30,
  nframes = 300,
  width = 1080,
  height = 1080,
  res = 150,
  renderer = av_renderer("courbe_polaire_finale.mp4")
)
