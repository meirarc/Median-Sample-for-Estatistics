# Define the workspace that contain all the data
setwd("<replace by your current workspace folder>")

# install packages
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

# define packages
library(dplyr)
library(data.table)
library(ggplot2)

# define data set
dados_iris <- iris

# Create a measure median summarizing the Iris data group by Species
# Summarize the data set by median data for Sepal and Petal by lendgh and Width
# View data set sumarization
library(dplyr)
media_iris <- summarize(group_by(dados_iris, Species),
                        media_sepal_length = mean(Sepal.Length),
                        media_sepal_width = mean(Sepal.Width),
                        media_petal_length = mean(Petal.Length),
                        media_petal_width = mean(Petal.Width))
View(media_iris)


# transform the data set to a table 
# Perform the transformation of data type of Sepal Lengh field
library(data.table)
dados_iris_id <- data.table(dados_iris)
View(dados_iris_id)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)
View(dados_iris_id)


# Plot the data using ggplot2 library to a chart view
library(ggplot2)
ggplot(data = dados_iris, aes(x = Petal.Width, y=Petal.Length)) +
  geom_point(aes(color = Species), size=3)+
  ggtitle("Largura e Comprimento das Petalas")+
  labs(x = "Largura das Petalas", 
       y = "Comprimento das Petalas")+
  theme_bw()+
  theme(title = element_text(size=15, color="turquoise4"))
