# Séquence d'angles
theta <- seq(0, 2*pi, length.out = 1000)

# Liste de valeurs de n
n_values <- 1:5   # par exemple n = 1, 2, 3, 4, 5

# Préparation du graphique
plot(0, 0, type = "n", xlim = c(-6, 6), ylim = c(-6, 6),
     xlab = "x", ylab = "y", asp = 1)
grid()

colors <- rainbow(length(n_values))

# Boucle sur les différentes valeurs de n
for (i in seq_along(n_values)) {
  n <- n_values[i]
  r <- 1+ cos(n* theta) + sin(n * theta)^2
  x <- r * cos(theta)
  y <- r * sin(theta)
  lines(x, y, col = colors[i], lwd = 2)
}

legend("topright", legend = paste("n =", n_values),
       col = colors, lwd = 2)

library(ggplot2)

library(gganimate)

# Création des données pour plusieurs n
theta <- seq(0, 2*pi, length.out = 500)
n.values <- 1:10

df <- do.call(rbind, lapply(n.values, function(n) {
  r <- 2 + 3*sin(4*theta*n)
  data.frame(
    theta = theta,
    n = n,
    x = r*cos(theta),
    y = r*sin(theta)
  )
}))

# Création du graphique animé
p <- ggplot(df, aes(x, y, group = n)) +
  geom_path(color = "blue", linewidth = 1.2) +
  coord_equal() +
  labs(title = expression(r = 1 + cos(n*theta) + sin(n*theta)),
       subtitle = "n = {frame_time}",
       x = "x", y = "y") +
  transition_time(n) +
  ease_aes('linear')

animate(p, fps = 10, nframes = 1000, renderer = gifski_renderer())

anim <- animate(p, fps = 10, nframes = 100, renderer = gifski_renderer())
anim_save("courbe_polaire.gif", animation = anim)


animate(p, renderer = av_renderer("courbe_polaire.mp4"))
