library(igraph)

# Create the base graph:

base_g <- erdos.renyi.game(20, 71, type = "gnm")

# Add the additional vertices and edges:

g <- add.vertices(base_g, 8)
g <- add.edges(
  g,
  c(
    21,22, 21,23, 21,24,
    22,23, 22,24,
    23,24,
    25,26, 25,27, 25,28,
    26,27, 26,28,
    27,28,
    24,25
  ))

# And the modified version of g:
g2 <- add.edges(g, c(1,2), edge.color = "red")

# Cluster both:
g_opt <- cluster_optimal(g)
g2_opt <- cluster_optimal(g2)

# Plot both:
glayout <- layout.davidson.harel(g2)
plot(g, layout=glayout, vertex.color=g_opt$membership)
plot(g2, layout=glayout, vertex.color=g2_opt$membership)

# This code only lets us find the right threshold - in this case it was 71 edges.
# We get a nicer plot by manually choosing the edge to add to g, instead of always
# picking 1--2.
