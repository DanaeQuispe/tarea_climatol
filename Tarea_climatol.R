library(climatol)
data(datcli)
data(windfr)
data(tmax) 
data(Ptest)
setwd("F:/Dana/ciclo 2021-2/programacion/tarea_climatol")
# Nivel 1

## 1.1

diagwl(datcli, "Est. Campo de Marte", 80, "2017", 
       pcol = "orange", tcol = "green", pfcol="blue",
       sfcol = "cyan", shem=FALSE, p3line = T)

## 1.2

rosavent(windfr, fnum = 5, fint = 2.5, flab = 1, ang = 3*pi/8,
         col = rainbow(8), uni = "km/s")

# Nivel 2

## 2.1
data(tmax)
# Exportar el archivo de la database de R 
write.table(dat, "tmax_2001-2003.dat", row.names = F, col.names = F)
write.table(est.c, "tmax_2001-2003.est", row.names = F, col.names = F)
# Convertir a data de medias mensuales
dd2m("tmax", 2001, 2003, ndec = 2, valm = 2)
read.table("tmax-m_2001-2003.dat")
# Homogenizar
homogen("tmax-m", 2001, 2003, std = 3, ndec = 2, gp = 2, expl = TRUE)

## 2.2

# Recortar la data mensual
data(Ptest)
dim(dat)
write.table(dat,"Ptest_1951-2010.dat", row.names = F, col.names = F)
write.table(est.c,"Ptest_1951-2010.est", row.names = F, col.names = F)
datsubset("Ptest", 1951, 2010, 1965, 2005, 1)
read.table("Ptest_1965-2005.dat")
# Homogenizar 
homogsplit("Ptest", 1965, 2005, 2.9, 39, xo = 0, yo = 0, std = 3, gp = 4, expl = TRUE, nm = 12)
# resumen estadistico
dahstat("Ptest", 1965, 2005, stat = "me", ndc = 2, vala = 1, estcol = c(1, 2, 5))








