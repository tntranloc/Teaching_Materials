
# Install necessary packages if not already installed
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("rnaturalearth")) install.packages("rnaturalearth")
if (!require("rnaturalearthdata")) install.packages("rnaturalearthdata")
if (!require("sf")) install.packages("sf")

# Load the necessary libraries
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(sf)
library(prettymapr)
# Get the map data for Europe
world <- ne_countries(scale = "medium", returnclass = "sf")
europe <- world[world$continent == "Europe", ]


# Create a watercolor style background
watercolor_background <- theme(
  panel.background = element_rect(fill = "transparent", color = NA),
  plot.background = element_rect(fill = "transparent", color = NA),
  panel.grid.major = element_line(color = "grey"),
  panel.grid.minor = element_line(color = "grey"),
  plot.title = element_text(size = 14, face = "bold"),
  axis.title = element_text(size = 12),
  axis.text = element_text(size = 10)
)

# Plot the map of Europe with customized background
ggplot(data = europe) +
  geom_sf(fill = "lightyellow", color = "black") +
  coord_sf(xlim = c(-10, 40), ylim = c(35, 70), expand = FALSE) +
  theme_minimal() +
  labs(title = "Map of Europe", x = "Longitude", y = "Latitude") +
  watercolor_background


# Plot the map of Europe
ggplot(data = europe) +
  geom_sf() +
 # theme_minimal() +
  labs(title = "Map of Europe") +
  scale_x_continuous(limits = c(-10, 35)) +
  scale_y_continuous(limits = c(35, 65)) +
  theme_void()
