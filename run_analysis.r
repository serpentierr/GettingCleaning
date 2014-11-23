# Analyse

# Variabele met pathnaam naar wd
filePath = "U:/datasciencecoursera/GettingCleaning/UCI HAR Dataset/"

# Files inlezen
xTrain = read.table(paste(filePath, "train/X_train.txt", sep=""))
yTrain = read.table(paste(filePath, "train/Y_train.txt", sep=""))
xTest = read.table(paste(filePath, "test/X_test.txt", sep=""))
yTest = read.table(paste(filePath, "test/y_test.txt", sep=""))


# Variabelen en activiteiten inlezen
variabelen = read.table(paste(filePath, "features.txt", sep="")); variabelen = variabelen[,2];
activiteiten = read.table(paste(filePath, "activity_labels.txt", sep="")); 

# kolommen correct benoemen
names(xTrain) <- variabelen
names(xTest) <- variabelen

## Merge Test en Train
xTabel = rbind(xTest,xTrain)
yTabel = rbind(yTest,yTrain)

# variabelen zoeken die "Mean" zijn 
meanVariabelen = grep("[m]ean", variabelen)

# update xTabel
xTabelMean = xTabel[,meanVariabelen]

# wegschrijven
write.csv(xTabelMean,file=paste(filePath, "xTabelMean.txt", sep=""))

yTabelLabels=vector(mode="character", length=length(yTabel))

# bouw labels op
for(a in 1:6){
  inds = which(yTabel==a)
  yTabelLabels[inds] <- as.character(activiteiten[a,2])
}

# laad subject IDs
trainingOnderwerp = read.table(paste(filePath, "train/subject_train.txt", sep=""))
testOnderwerp = read.table(paste(filePath, "test/subject_test.txt", sep=""))

## hernoem IDs
maakOnderwerp = function(x){return(paste("Onderwerp", as.character(x), sep=""))}
onderwerpenTest= sapply(testOnderwerp, FUN=maakOnderwerp)
onderwerpenTrain= sapply(trainingOnderwerp, FUN=maakOnderwerp)

# merge alle onderwerpen
onderwerpen = rbind(onderwerpenTrain, onderwerpenTest)


### maak tweede dataset
tweedeSet = matrix(ncol=length(names(xTabelMean)), nrow=length(unique(onderwerpen)))
rownames(tweedeSet) = unique(onderwerpen); 
colnames(tweedeSet) = names(xTabelMean);

# bereken het gemiddelde voor iedere variabele in alle onderwerpen
for(s in unique(onderwerpen)){
  w = which(onderwerpen == s)
  cm = colMeans(xTabelMean[w,])
  tweedeSet[s,] = cm
}
write.csv(tweedeSet,file=paste(filePath, "tweedeSet.txt", sep=""))