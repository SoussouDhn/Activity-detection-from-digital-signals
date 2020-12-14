# Partie 1 visualisation des données 
library(Hmisc)

data = read.table("../data.txt", header = F)
datamat = as.matrix(data)
describe(data)


data2 = read.table("../data2.txt", header = F)
datamat2 = as.matrix(data2)
describe(data2)

true.labels = read.table("../labels.txt", header = F)
labelsmat = as.matrix(true.labels)
table(labelsmat)


par(mfrow=c(2,3))
for(i in 1:6){
  plot(datamat[which(i == labelsmat)[1],], type="l", main=paste("Echantillon de la classe" ,i,sep=" "), xlab="time", ylab="vitesse / accélération ")
}

for(i in 1:6){
  plot(datamat2[which(i == labelsmat)[1],], type="l", main=paste("Echantillon de la classe" ,i,sep=" "), xlab="time", ylab="vitesse / accélération ")
}

#Classification automatique 
library(TSdist)
library(TSclust)
library(cluster)

#1er méthode 
clus.eucl = pam(datamat2, metric = "euclidean", k=6)
clus.eucl$clustering
table(clus.eucl$clustering)

#2eme méthode
# Matrice des distances
D = dist(datamat2, method = "euclidean")
# Mise en oeuvre de l'algorithme
H = hclust(D, method="ward.D2")
# Représentation graphique (dendrogramme)
par(mfrow=c(1,1))
plot(H, hang=-1)
# Visualisation des paliers décroissants du dendrogramme
plot(rev(H$height),type="h",xlim=c(0,20))
# Coupe de l'arbre pour trouver la meilleure partition en K=6 classes
classes = cutree(H, k=6)
table(classes)
#3eme méthode
# Lancer des k-means pour K=6 classes
KM <- kmeans(datamat2, 6, nstart = 10)
# Résultats
summary(KM)
# Centres des classes
KM$centers
# Classe de chaque objet
KM$cluster
# Inertie intra-classe
KM$tot.withinss

#4 eme méthode
clust_flou = fanny(datamat2,6,memb.exp=2)
clust_flou[400]
par(mfrow=c(1,1))
plot(datamat2,col=clust_flou$clustering)
# Degrés d'appartenance des données aux classes
matplot(clust_flou$membership,type="l",lty=1)

clust_flou$clustering[4]
summary(clust_flou)


library(mcclust)
vi.dist(classes,labelsmat, parts=T)


library(mclust)
adjustedRandIndex(classes,labelsmat)


l = c(labelsmat)
m = c(classes)

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
aricode::NMI(l,m, variant = "max")

