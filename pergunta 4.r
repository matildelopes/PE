set.seed(2639)
amostra <- rexp(1088,10.5)
t<-c()
t[0]<-0
t[1]<-0
for (i in 1:1088) {
t[i+1]<-(t[i]+amostra[i])
}
T<-t[1089]
k<-1
v<-c()
v[1]<-0
for (j in 1:103) {
v[j]<-0
     while (t[k]<j && k<1090){
		v[j]<-v[j]+1
		k=k+1
	}
}
v[1]<-v[1]-1
media<-mean(v)
resposta<-media-10.5

0,0728
