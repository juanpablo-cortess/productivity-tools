#preparación con versión antigua
installed_packages<-as.data.frame(installed.packages())
fecha<-Sys.Date()
installed_packages_names<-as.vector(installed_packages$Package)
nombre<-paste('paquetes_al_',fecha,'.csv',sep = '')
write.csv(installed_packages_names,nombre)

#lectura de documento csv
paquetes_a_instalar<-as.vector(read.csv(nombre)$x)

#loop para instalar paquetes
for (i in 1:length(paquetes_a_instalar)){
  install.packages(paquetes_a_instalar[i])
}

#nuevos paquetes instalados
total_instalado<-as.vector((as.data.frame(installed.packages()))$Package)

#revisión de paquetes que no se instalaron si es 0 se instaló todo
setdiff(paquetes_a_instalar,total_instalado)

#revisión de paquetes adicionales instalados
setdiff(total_instalado,paquetes_a_instalar)
