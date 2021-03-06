batch <- beta_BMIQ_filter
pcbatch <- princomp(batch,cor=T)
pdf("pcv1.pdf")
plot(pcbatch$loadings,pch=18)
text(pcbatch$loadings,substring(row.names(pcbatch$loadings),8),pos=4,cex=.7)
#text(pcbatch$loadings,sub("SAMPLE_"," ",rownames(pcbatch$loadings)),pos=4,cex=.7)
dev.off()

datat <- t(beta_BMIQ_filter) 
alldata <- data.frame(datat,targets$individual,targets$tissue, targets$pregnancy)
library(ggfortify)
a <- autoplot(prcomp(alldata[,c(1:nrow(beta_BMIQ_filter))]),data=alldata,colour="targets.individual")
pdf("pcv2.pdf")
plot(a)
dev.off()