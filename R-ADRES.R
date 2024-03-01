library(tidyverse)

library(DBI)
library(RSQLite)

install.packages("summarytools")

# Especifica la ruta completa al archivo de la base de datos
ruta_basedatos <- "C:/SQLITE/Bases de datos/ADRES.db"

# Conéctate a la base de datos SQLite
Base_Datos <- dbConnect(RSQLite::SQLite(), dbname = ruta_basedatos)

dbListTables(Base_Datos)

mapeo_departamentos <- c("AntioqUia" = "Antioquia","Antioquia" = "Antioquia")
# Crear un mapeo de nombres de departamentos
mapeo_departamentos <- c(" Ant%ioqUia" = "Antioquia",
                         "Ant%ioquia" = "Antioquia",
                         " Ant%io>qUia" = "Antioquia",
                         " Antioquia" = "Antioquia",
                         "AntioqUia" = "Antioquia",
                         "Ant%ioquia   " = "Antioquia",
                         "Antioq>Uia" = "Antioquia",
                         "Ant%ioquia " = "Antioquia",
                         "Antioq>uia   " = "Antioquia",
                         " Ant%ioqUia " = "Antioquia",
                         "Ant%ioq>uia" = "Antioquia",
                         "Antioquia " = "Antioquia",
                         "   Ant%ioqUia   " = "Antioquia",
                         "Ant%io>quia" = "Antioquia",
                         "Ant%io>qUia   " = "Antioquia",
                         "Antioquia   " = "Antioquia",
                         "   Antioquia   " = "Antioquia",
                         "Antioq>Uia " = "Antioquia",
                         "   Antioq>uia   " = "Antioquia",
                         "Ant%ioq>uia " = "Antioquia",
                         "   Antioq>uia" = "Antioquia",
                         "Ant%ioq>Uia   " = "Antioquia",
                         "   Ant%ioq>uia" = "Antioquia",
                         "   Antioquia" = "Antioquia",
                         "   Ant%ioquia" = "Antioquia",
                         " Antioq>uia " = "Antioquia",
                         " Antioquia " = "Antioquia",
                         " Antioq>uia" = "Antioquia",
                         " Ant%io>qUia " = "Antioquia",
                         "Ant%io>quia " = "Antioquia",
                         " Ant%ioq>Uia " = "Antioquia",
                         "Atl%án>tico   " = "Atlántico",
                         "Atlántico   " = "Atlántico",
                         " Atl%ántico " = "Atlántico",
                         "Atl%ántico " = "Atlántico",
                         "Atlántico " = "Atlántico",
                         "Atlántico" = "Atlántico",
                         " Atlánt>ico " = "Atlántico",
                         "Atl%ántico   " = "Atlántico",
                         "   Atlántico   " = "Atlántico",
                         " Atl%ánt>ico" = "Atlántico",
                         "Atl%ántico" = "Atlántico",
                         " Atlántico " = "Atlántico",
                         "   Atlánt>ico   " = "Atlántico",
                         " Atl%ántico" = "Atlántico",
                         "Atl%ánt>ico" = "Atlántico",
                         "   Atlántico" = "Atlántico",
                         "Bogotá   D   C" = "Bogotá D.C.",
                         "   Bolívar   " = "Bolívar",
                         " Bo%lí>var " = "Bolívar",
                         "   Bo%lí>var" = "Bolívar",
                         "   Bolívar" = "Bolívar",
                         "Bolívar" = "Bolívar",
                         "Bo%lívar   " = "Bolívar",
                         "Bolív>ar   " = "Bolívar",
                         " Bolí>var " = "Bolívar",
                         "Bolívar   " = "Bolívar",
                         "Bolívar " = "Bolívar",
                         " Bolívar " = "Bolívar",
                         "   Bo%lí>var   " = "Bolívar",
                         " Bo%lívar" = "Bolívar",
                         "   Bo%lívar   " = "Bolívar",
                         "   Bolív>ar   " = "Bolívar",
                         " Bolív>ar" = "Bolívar",
                         "   Bolí>var   " = "Bolívar",
                         "Bolív>ar " = "Bolívar",
                         " Bolív>ar " = "Bolívar",
                         "   Bo%lívar" = "Bolívar",
                         " Bolívar" = "Bolívar",
                         "Bo%lívar" = "Bolívar",
                         " Bo%lívar " = "Bolívar",
                         "Boyacá     " = "Boyacá",
                         "Boyacá   " = "Boyacá",
                         "Boyacá " = "Boyacá",
                         "Boya%cá               " = "Boyacá",
                         " Boyacá      " = "Boyacá",
                         "   Boya%cá               " = "Boyacá",
                         "Boya%cá     " = "Boyacá",
                         "Boya%cá   >               " = "Boyacá",
                         "   Boyacá   >               " = "Boyacá",
                         " Boyacá     " = "Boyacá",
                         "Boyacá      " = "Boyacá",
                         " Boya%cá >     " = "Boyacá",
                         "   Boyacá                  " = "Boyacá",
                         " Boya%cá >    " = "Boyacá",
                         "Boyacá >    " = "Boyacá",
                         "   Boyacá   >            " = "Boyacá",
                         " Boyacá >    " = "Boyacá",
                         "   Boyacá               " = "Boyacá",
                         "Boyacá   >            " = "Boyacá",
                         "   Boya%cá   >            " = "Boyacá",
                         "Boyacá   >               " = "Boyacá",
                         "Boyacá                  " = "Boyacá",
                         " Boya%cá     " = "Boyacá",
                         "Boyacá               " = "Boyacá",
                         "   Boya%cá   >               " = "Boyacá",
                         "Boya%cá                  " = "Boyacá",
                         "Boya%cá >    " = "Boyacá",
                         "Boya%cá   >            " = "Boyacá",
                         "Boyacá >     " = "Boyacá",
                         " Boya%cá      " = "Boyacá",
                         " Boyacá >     " = "Boyacá",
                         "   Boya%cá                  " = "Boyacá",
                         "Boya%cá      " = "Boyacá",
                         "Ca%l>das" = "Caldas",
                         "Caldas" = "Caldas",
                         "   Caldas   " = "Caldas",
                         " Cald>as" = "Caldas",
                         "Ca%ldas " = "Caldas",
                         "Cald>as " = "Caldas",
                         "Caldas   " = "Caldas",
                         "Caldas " = "Caldas",
                         "Cald>as" = "Caldas",
                         "   Ca%ld>as   " = "Caldas",
                         " Caldas" = "Caldas",
                         "   Cald>as" = "Caldas",
                         " Caldas " = "Caldas",
                         " Ca%ldas" = "Caldas",
                         " Ca%ldas " = "Caldas",
                         "   Ca%ldas   " = "Caldas",
                         "   Caldas" = "Caldas",
                         "Ca%qu>etá   " = "Caquetá",
                         " Ca%qUetá " = "Caquetá",
                         " Caquetá " = "Caquetá",
                         " Caqu>etá" = "Caquetá",
                         "Ca%qu>etá " = "Caquetá",
                         " Caque>tá" = "Caquetá",
                         "Caquetá" = "Caquetá",
                         "CaqUetá " = "Caquetá",
                         "CaqUetá" = "Caquetá",
                         "   Ca%quetá" = "Caquetá",
                         "Ca%qUetá" = "Caquetá",
                         "Caqu>etá" = "Caquetá",
                         " CaqUe>tá " = "Caquetá",
                         "Ca%quetá   " = "Caquetá",
                         " Cau>ca" = "Cauca",
                         "CaUca" = "Cauca",
                         "   Cauca   " = "Cauca",
                         "   Ca%uca" = "Cauca",
                         " Ca%Uca " = "Cauca",
                         "Ca%Uca" = "Cauca",
                         "   Cauca" = "Cauca",
                         "   Ca%U>ca   " = "Cauca",
                         "CaU>ca" = "Cauca",
                         " Ca%Uca" = "Cauca",
                         "CaUca   " = "Cauca",
                         "   CaU>ca   " = "Cauca",
                         " Cau>ca " = "Cauca",
                         " CaUca " = "Cauca",
                         "Ca%Uca " = "Cauca",
                         "Cau>ca   " = "Cauca",
                         "   CaU>ca" = "Cauca",
                         "CaUca " = "Cauca",
                         " CaUca" = "Cauca",
                         "Ca%uca   " = "Cauca",
                         "   Cesar" = "Cesar",
                         "   Cesar   " = "Cesar",
                         "Cesar" = "Cesar",
                         " Ce%sar " = "Cesar",
                         "   Ces>ar" = "Cesar",
                         "   Ces>ar   " = "Cesar",
                         "Ce%s>ar " = "Cesar",
                         "Ce%sar" = "Cesar",
                         "   Ce%sar   " = "Cesar",
                         "Ces>ar" = "Cesar",
                         "Ce%sar   " = "Cesar",
                         "   Ce%sar" = "Cesar",
                         " Cesar " = "Cesar",
                         "Ces>ar " = "Cesar",
                         "Ce%s>ar" = "Cesar",
                         " Ce%s>ar " = "Cesar",
                         "Có%rd>oba" = "Córdoba",
                         "Córd>oba   " = "Córdoba",
                         " Córdoba" = "Córdoba",
                         "Córd>oba" = "Córdoba",
                         "Córdoba" = "Córdoba",
                         "Córdoba   " = "Córdoba",
                         "Có%rdoba   " = "Córdoba",
                         "Có%rdoba" = "Córdoba",
                         " Córdo>ba " = "Córdoba",
                         "   Có%rdoba   " = "Córdoba",
                         "   Córdo>ba" = "Córdoba",
                         "Córdoba " = "Córdoba",
                         " Córd>oba" = "Córdoba",
                         " Có%rdoba" = "Córdoba",
                         "   Córdoba" = "Córdoba",
                         "Córdo>ba   " = "Córdoba",
                         " Có%rd>oba " = "Córdoba",
                         " Córd>oba " = "Córdoba",
                         "Có%rd>oba " = "Córdoba",
                         "Cundinamarca" = "Cundinamarca",
                         "   CUndinamarca" = "Cundinamarca",
                         " Cundinamarca " = "Cundinamarca",
                         " Cund%inamarca" = "Cundinamarca",
                         "CUndinamarca " = "Cundinamarca",
                         "   CUndinamarca   " = "Cundinamarca",
                         "CUnd%inamarca   " = "Cundinamarca",
                         " Cundinam>arca " = "Cundinamarca",
                         "   Cund%inamarca" = "Cundinamarca",
                         "   CUnd%inamarca   " = "Cundinamarca",
                         "CUndinam>arca" = "Cundinamarca",
                         "CUndinam>arca " = "Cundinamarca",
                         "CUndinamarca   " = "Cundinamarca",
                         "Cundinamarca" = "Cundinamarca",
                         "CUndinamarca" = "Cundinamarca",
                         "Cundinam>arca   " = "Cundinamarca",
                         "CUnd%ina>marca   " = "Cundinamarca",
                         "Cund%inamarca " = "Cundinamarca",
                         "CUnd%inamarca" = "Cundinamarca",
                         "   CUndinam>arca" = "Cundinamarca",
                         " CUnd%ina>marca " = "Cundinamarca",
                         "CUnd%inam>arca " = "Cundinamarca",
                         "   CUnd%inam>arca   " = "Cundinamarca",
                         "Cund%ina>marca " = "Cundinamarca",
                         "   Cundinam>arca   " = "Cundinamarca",
                         "Cund%inam>arca" = "Cundinamarca",
                         " Cund%inam>arca" = "Cundinamarca",
                         " CUndinam>arca" = "Cundinamarca",
                         "   Cund%inam>arca" = "Cundinamarca",
                         "Cund%ina>marca" = "Cundinamarca",
                         " Cundinamarca" = "Cundinamarca",
                         " Cund%inamarca " = "Cundinamarca",
                         "Chocó " = "Chocó",
                         "Ch%ocó" = "Chocó",
                         " Cho>có" = "Chocó",
                         "   Chocó" = "Chocó",
                         "Ch%o>có" = "Chocó",
                         "   Ch%ocó   " = "Chocó",
                         " Ch%o>có" = "Chocó",
                         " Ch%ocó" = "Chocó",
                         "   Chocó   " = "Chocó",
                         " Chocó " = "Chocó",
                         " Ch%o>có " = "Chocó",
                         "Ch%o>có " = "Chocó",
                         "Cho>có   " = "Chocó",
                         "Ch%o>có   " = "Chocó",
                         " Chocó" = "Chocó",
                         "   Cho>có   " = "Chocó",
                         "   Ch%ocó" = "Chocó",
                         "   Hu%i>la   " = "Huila",
                         " Hu%i>la " = "Huila",
                         "HU%ila" = "Huila",
                         "HUila" = "Huila",
                         " HUila " = "Huila",
                         "   HUila   " = "Huila",
                         "   HU%ila" = "Huila",
                         " Hui>la " = "Huila",
                         "Hu%i>la   " = "Huila",
                         "HUila " = "Huila",
                         "Hu%ila   " = "Huila",
                         " Huila" = "Huila",
                         "HU%ila " = "Huila",
                         "Hui>la " = "Huila",
                         "HU%i>la" = "Huila",
                         "Hui>la   " = "Huila",
                         "HUi>la" = "Huila",
                         "   HUi>la   " = "Huila",
                         "   HUi>la" = "Huila",
                         " HU%i>la" = "Huila",
                         "   La   GUajira   " = "La Guajira",
                         "   La   Guajira" = "La Guajira",
                         "La   GUa>jira   " = "La Guajira",
                         "   La%   Guajira   " = "La Guajira",
                         "La%   Gua>jira" = "La Guajira",
                         "La GUaj>ira" = "La Guajira",
                         "La% Guajira " = "La Guajira",
                         " La GUa>jira " = "La Guajira",
                         "La %GUajira" = "La Guajira",
                         "La   Guajira" = "La Guajira",
                         "La GUa>jira" = "La Guajira",
                         " La GUajira" = "La Guajira",
                         "La   GUajira" = "La Guajira",
                         "La Guajira" = "La Guajira",
                         "La GUajira" = "La Guajira",
                         "   Magdal>ena   " = "Magdalena",
                         "   Magdalena   " = "Magdalena",
                         " Mag%dal>ena " = "Magdalena",
                         "Mag%dal>ena " = "Magdalena",
                         "Magdalena " = "Magdalena",
                         "Magdal>ena" = "Magdalena",
                         "Magdalena   " = "Magdalena",
                         "   Magdalena" = "Magdalena",
                         " Magdal>ena" = "Magdalena",
                         "Magdal>ena " = "Magdalena",
                         "Magdalena" = "Magdalena",
                         " Magdalena " = "Magdalena",
                         "Mag%dalena" = "Magdalena",
                         "Mag%dal>ena" = "Magdalena",
                         " Magdalena" = "Magdalena",
                         "   Magdal>ena" = "Magdalena",
                         " Mag%dal>ena" = "Magdalena",
                         " Mag%dalena " = "Magdalena",
                         "   Meta   " = "Meta",
                         "   Meta" = "Meta",
                         "Me>ta" = "Meta",
                         "M%eta   " = "Meta",
                         "Meta" = "Meta",
                         " M%eta " = "Meta",
                         "   M%eta" = "Meta",
                         "Me>ta " = "Meta",
                         "M%eta" = "Meta",
                         "   M%e>ta" = "Meta",
                         "Meta   " = "Meta",
                         "   M%eta   " = "Meta",
                         "M%eta " = "Meta",
                         " Met>a" = "Meta",
                         " M%e>ta" = "Meta",
                         "Met>a" = "Meta",
                         "M%e>ta " = "Meta",
                         "   Na%riño   " = "Nariño",
                         " Nariño " = "Nariño",
                         "   Na%r>iño" = "Nariño",
                         "Nariño   " = "Nariño",
                         "Nariño" = "Nariño",
                         "Nariño " = "Nariño",
                         "Na%riño " = "Nariño",
                         " Na%riño" = "Nariño",
                         " Nari>ño" = "Nariño",
                         "   Nari>ño   " = "Nariño",
                         "   Nariño" = "Nariño",
                         " Na%ri>ño " = "Nariño",
                         "   Nari>ño" = "Nariño",
                         " Nariño" = "Nariño",
                         "Na%riño   " = "Nariño",
                         " Nari>ño " = "Nariño",
                         "   Nariño   " = "Nariño",
                         " Na%r>iño" = "Nariño",
                         "Na%ri>ño " = "Nariño",
                         " Na%riño " = "Nariño",
                         "Na%ri>ño" = "Nariño",
                         "   Na%riño" = "Nariño",
                         "Na%riño" = "Nariño",
                         "Nari>ño" = "Nariño",
                         "   Na%ri>ño   " = "Nariño",
                         "Nari>ño " = "Nariño",
                         "Norte   de   San>tander" = "Norte de Santander",
                         "Norte de San>tander " = "Norte de Santander",
                         " Norte% de San>tander" = "Norte de Santander",
                         "Norte de Santander " = "Norte de Santander",
                         "   Norte   de   Santander" = "Norte de Santander",
                         "Norte de Santander" = "Norte de Santander",
                         " Norte% de Santander " = "Norte de Santander",
                         "Norte   de   San>tander   " = "Norte de Santander",
                         "   Norte   de   San>tander   " = "Norte de Santander",
                         " Norte de San>tander " = "Norte de Santander",
                         " Norte de Santander " = "Norte de Santander",
                         "Norte% de Santander" = "Norte de Santander",
                         "Norte   de   Santander" = "Norte de Santander",
                         "Norte   de   Santander   " = "Norte de Santander",
                         " Norte de Santander" = "Norte de Santander",
                         "   Norte   de   Santander   " = "Norte de Santander",
                         " Norte% de Sa>ntander " = "Norte de Santander",
                         "Norte%   de   Santander   " = "Norte de Santander",
                         "   Norte%   de   Santander   " = "Norte de Santander",
                         "   Norte   de   San>tander" = "Norte de Santander",
                         " Norte de San>tander" = "Norte de Santander",
                         "Norte% de Sa>ntander " = "Norte de Santander",
                         "QU%indío" = "Quindío",
                         "   Quindío" = "Quindío",
                         "QUindío" = "Quindío",
                         "Qu%indío   " = "Quindío",
                         " Quind>ío " = "Quindío",
                         "   Qu%in>dío" = "Quindío",
                         " QU%indío " = "Quindío",
                         " Qu%indío" = "Quindío",
                         "   QUind>ío   " = "Quindío",
                         "   QU%indío   " = "Quindío",
                         " Ris%ar>alda " = "Risaralda",
                         "Ris%ar>alda " = "Risaralda",
                         "   Ris%aralda" = "Risaralda",
                         " Ris%aralda" = "Risaralda",
                         "Ris%aralda   " = "Risaralda",
                         " Risaralda" = "Risaralda",
                         " Ris%ara>lda" = "Risaralda",
                         "   Ris%aralda   " = "Risaralda",
                         "Ris%aralda" = "Risaralda",
                         "Ris%aralda " = "Risaralda",
                         "Risaralda " = "Risaralda",
                         " Ris%aralda " = "Risaralda",
                         "Risaralda" = "Risaralda",
                         "Santan>der" = "Santander",
                         "Santander" = "Santander",
                         "San%tander   " = "Santander",
                         "Santander   " = "Santander",
                         " Santander " = "Santander",
                         "   San%ta>nder" = "Santander",
                         "Santander " = "Santander",
                         " San%ta>nder" = "Santander",
                         "   San%tan>der" = "Santander",
                         " Santander" = "Santander",
                         "San%ta>nder   " = "Santander",
                         "   Santan>der" = "Santander",
                         "San%ta>nder " = "Santander",
                         "San%tan>der" = "Santander",
                         " San%tander" = "Santander",
                         "San%tander" = "Santander",
                         "Santan>der " = "Santander",
                         " San%ta>nder " = "Santander",
                         "   Santander   " = "Santander",
                         "San%tander " = "Santander",
                         "San%tan>der   " = "Santander",
                         "   San%tander" = "Santander",
                         "   San%tander   " = "Santander",
                         "   Santander" = "Santander",
                         " San%tan>der " = "Santander",
                         "   Santan>der   " = "Santander",
                         " Santan>der" = "Santander",
                         " Santan>der " = "Santander",
                         "   Su%c>re   " = "Sucre",
                         " SUc>re" = "Sucre",
                         " SU%c>re" = "Sucre",
                         "   Sucre   " = "Sucre",
                         " SUcre " = "Sucre",
                         "   Su%cre   " = "Sucre",
                         "SUcre" = "Sucre",
                         "   SUc>re   " = "Sucre",
                         "SUcre   " = "Sucre",
                         "SU%cre " = "Sucre",
                         "SUc>re " = "Sucre",
                         " Sucre" = "Sucre",
                         "   Sucre" = "Sucre",
                         "SUc>re" = "Sucre",
                         "Su%cre" = "Sucre",
                         "   Su%cre" = "Sucre",
                         "SUcre " = "Sucre",
                         " Tolima " = "Tolima",
                         "To%lima   " = "Tolima",
                         "   Toli>ma   " = "Tolima",
                         " Toli>ma " = "Tolima",
                         "To%l>ima   " = "Tolima",
                         "   Tolima" = "Tolima",
                         " Tolima" = "Tolima",
                         "Tolima" = "Tolima",
                         "To%li>ma" = "Tolima",
                         " To%l>ima " = "Tolima",
                         "   Toli>ma" = "Tolima",
                         "Toli>ma   " = "Tolima",
                         "   To%lima   " = "Tolima",
                         "Tolima " = "Tolima",
                         "   Tolima   " = "Tolima",
                         "Toli>ma" = "Tolima",
                         "To%lima" = "Tolima",
                         "To%lima " = "Tolima",
                         "To%li>ma " = "Tolima",
                         " To%lima " = "Tolima",
                         "Toli>ma " = "Tolima",
                         "To%l>ima" = "Tolima",
                         " Toli>ma" = "Tolima",
                         " To%li>ma " = "Tolima",
                         "   To%li>ma   " = "Tolima",
                         "   Valle   %del   Cauca" = "Valle Del Cauca",
                         "Valle   del   Cauca   " = "Valle Del Cauca",
                         "Valle del CaUca" = "Valle Del Cauca",
                         "Valle   del   CaUca" = "Valle Del Cauca",
                         "Valle del Cauca " = "Valle Del Cauca",
                         " Valle del >Cauca " = "Valle Del Cauca",
                         "Valle   del   >Cauca   " = "Valle Del Cauca",
                         "   Valle   del   >Cauca   " = "Valle Del Cauca",
                         "Valle %del> CaUca" = "Valle Del Cauca",
                         " Valle del Cauca " = "Valle Del Cauca",
                         "   Valle   del   Cauca   " = "Valle Del Cauca",
                         "Valle   %del   >Cauca" = "Valle Del Cauca",
                         "Valle   %del>   Cauca" = "Valle Del Cauca",
                         "Valle %del> Cauca " = "Valle Del Cauca",
                         "Valle   del   Cauca" = "Valle Del Cauca",
                         " Valle del >Cauca" = "Valle Del Cauca",
                         " Valle %del> Cauca" = "Valle Del Cauca",
                         "Valle %del CaUca" = "Valle Del Cauca",
                         " Valle del CaUca" = "Valle Del Cauca",
                         "   Valle   del   CaUca" = "Valle Del Cauca",
                         "Valle   %del   CaUca" = "Valle Del Cauca",
                         "Valle del Cauca" = "Valle Del Cauca",
                         "   Valle   %del>   CaUca" = "Valle Del Cauca",
                         "Valle   del   >CaUca" = "Valle Del Cauca",
                         "   Valle   del   >CaUca" = "Valle Del Cauca",
                         " Valle %del Cauca " = "Valle Del Cauca",
                         "   Valle   %del>   CaUca   " = "Valle Del Cauca",
                         "Valle %del Cauca " = "Valle Del Cauca",
                         " Valle %del Cauca" = "Valle Del Cauca",
                         " AraU>ca " = "Arauca",
                         "Arauca" = "Arauca",
                         "AraUca" = "Arauca",
                         "Ar%auca" = "Arauca",
                         "   Ar%auca   " = "Arauca",
                         "   Arau>ca" = "Arauca",
                         "Arau>ca" = "Arauca",
                         "Cas%anare " = "Casanare",
                         " Casanare" = "Casanare",
                         "Casanare" = "Casanare",
                         "Cas%anare" = "Casanare",
                         "   Cas%an>are" = "Casanare",
                         "   Cas%an>are   " = "Casanare",
                         "Casan>are" = "Casanare",
                         " Casan>are" = "Casanare",
                         "   Casanare   " = "Casanare",
                         "   Cas%anare   " = "Casanare",
                         " Cas%anare " = "Casanare",
                         " Casanare " = "Casanare",
                         "   Casan>are   " = "Casanare",
                         "PUtUmayo " = "Putumayo",
                         "PUt%Umayo   " = "Putumayo",
                         "Putumayo   " = "Putumayo",
                         "   PUtUmayo" = "Putumayo",
                         " PUtUmayo " = "Putumayo",
                         "Put%umayo " = "Putumayo",
                         "   Put%umayo" = "Putumayo",
                         "PUtUmayo" = "Putumayo",
                         " PUtUm>ayo " = "Putumayo",
                         " PUt%Umayo" = "Putumayo",
                         " San %An>drés" = "San Andrés",
                         "   San   Andrés" = "San Andrés",
                         "San   Andrés" = "San Andrés",
                         " Ama%zonas " = "Amazonas",
                         " Amazonas" = "Amazonas",
                         "Ama%zonas   " = "Amazonas",
                         "Amazonas   " = "Amazonas",
                         "Amazonas" = "Amazonas",
                         "Ama%zonas" = "Amazonas",
                         "Amazo>nas" = "Amazonas",
                         "Ama%zo>nas " = "Amazonas",
                         "   Ama%zo>nas   " = "Amazonas",
                         " Amazonas " = "Amazonas",
                         "Guain>ía" = "Guainía",
                         "Guainía" = "Guainía",
                         "GUainía" = "Guainía",
                         " Guai>nía" = "Guainía",
                         "GU%ai>nía " = "Guainía",
                         "   Guain>ía   " = "Guainía",
                         "   GU%ainía   " = "Guainía",
                         "GU%ainía" = "Guainía",
                         "GUainía   " = "Guainía",
                         "GU%ainía " = "Guainía",
                         "GUavi>are " = "Guaviare",
                         "   Guaviare" = "Guaviare",
                         "GUaviare" = "Guaviare",
                         " GUa%viare " = "Guaviare",
                         " Vaupés" = "Vaupés",
                         " Va%Up>és " = "Vaupés",
                         "Vaup>és" = "Vaupés",
                         "   Vaupés   " = "Vaupés",
                         "VaUpés" = "Vaupés",
                         "Vaupés" = "Vaupés",
                         " Va%Upés " = "Vaupés",
                         " Vi%ch>ada" = "Vichada",
                         "Vichada" = "Vichada",
                         "Vi%ch>ada" = "Vichada",
                         "Vichada   " = "Vichada")
# Actualizar los nombres en la base de datos
for (old_name in names(mapeo_departamentos)) {
  new_name <- mapeo_departamentos[old_name]
  query <- sprintf("UPDATE Municipios SET Departamento = '%s' WHERE Departamento = '%s'", new_name, old_name)
  dbExecute(Base_Datos, query)
}
# Consulta para ver los valores únicos en el campo "Departamento" después de la normalización
nuevos_valores_unicos <- dbGetQuery(Base_Datos, "SELECT DISTINCT Departamento FROM Municipios")
# Imprimir los nuevos valores únicos
print(nuevos_valores_unicos)
# Conectar a la base de datos SQLite
Base_Datos <- dbConnect(RSQLite::SQLite(), dbname = "ruta_de_tu_base_de_datos")

# Actualizar la columna Departamento
dbExecute(Base_Datos, "UPDATE Municipios SET Departamento = REPLACE(REPLACE(Departamento, '%', ''), '>', '')")
dbListTables(Base_Datos)
# Especifica la ruta completa al archivo de la base de datos
ruta_basedatos <- "C:/SQLITE/Bases de datos/ADRES.db"

# Conéctate a la base de datos SQLite
Base_Datos <- dbConnect(RSQLite::SQLite(), dbname = ruta_basedatos)

dbListTables(Base_Datos)
# Actualizar la columna Departamento
dbExecute(Base_Datos, "UPDATE Municipios SET Departamento = REPLACE(REPLACE(Departamento, '%', ''), '>', '')")
# Consulta para ver los valores únicos en el campo "Departamento" después de la normalización
nuevos_valores_unicos <- dbGetQuery(Base_Datos, "SELECT DISTINCT Departamento FROM Municipios")
# Imprimir los nuevos valores únicos
print(nuevos_valores_unicos)
# Consulta para ver los valores únicos en el campo "Municipio" antes de la normalización
valores_unicos_Municipio <- dbGetQuery(Base_Datos, "SELECT DISTINCT Municipio FROM Municipios")

# Imprimir los valores únicos campo Municipio
print(valores_unicos_Municipio)

# Actualizar la columna Municipio
dbExecute(Base_Datos, "UPDATE Municipios SET Municipio = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Municipio, '*', ''), '#', ''), '&', ''), '!', ''), '?', ''), '''', ''), '\"', '')")

# Crear un mapeo de nombres de municipios
mapeo_Municipio <- c("Abej!&orr*al" = "Abejorral",
                     "A?br'&iaquí" = "Abriaquí",
                     "Alej#andr&'ía" = "Alejandría")

# Actualizar los nombres en la base de datos
for (old_name in names(mapeo_Municipio)) {
  new_name <- mapeo_Municipio[old_name]
  query <- sprintf('UPDATE Municipios SET Municipio = "%s" WHERE Municipio = "%s"', new_name, old_name)
  dbExecute(Base_Datos, query)
}
# Consulta para ver los valores únicos en el campo "Municipio" después de la normalización
nuevos_valores_unicos_Municipio <- dbGetQuery(Base_Datos, "SELECT DISTINCT Municipio FROM Municipios")
# Imprimir los nuevos valores únicos
print(nuevos_valores_unicos_Municipio)

# Actualizar la columna Municipio eliminando espacios adicionales
dbExecute(Base_Datos, "UPDATE Municipios SET Municipio = TRIM(Municipio)")

# Actualizar la columna Municipio eliminando espacios adicionales entre palabras
dbExecute(Base_Datos, "UPDATE Municipios SET Municipio = TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Municipio, '\t', ' '), '  ', ' '), '   ', ' '), '    ', ' '), '     ', ' '))")

# Imprimir los nuevos valores únicos
print(nuevos_valores_unicos_Municipio)

# Consulta para ver los municipios después de la actualización
resultados_actualizados <- dbGetQuery(Base_Datos, "SELECT DISTINCT Municipio FROM Municipios")

# Imprimir los resultados
print(resultados_actualizados)

# Crear un mapeo de nombres de municipios
mapeo_Municipio <- c("El  Carmen  de  Viboral" = "El Carmen de Viboral",
                     "Don  Matías" = "Don Matías",
                     "Guatapé " = "Guatapé",
                     "Itagui  " = "Itagui",
                     "La  Ceja" = "La Ceja",
                     "La  Estrella" = "La Estrella",
                     "La  Pintada" = "La Pintada",
                     "La  Unión" = "La Unión",
                     "Puerto  Berrío" = "Puerto Berrío",
                     "Puerto  Triunfo" = "Puerto Triunfo",
                     "San  Andrés  de  Cuerquía" = "San Andrés de Cuerquía",
                     "San  Francisco" = "San Francisco",
                     "San  Jerónimo" = "San Jerónimo",
                     "San  Juan  de  Urabá" = "San Juan de Urabá",
                     "San  Rafael" = "San Rafael",
                     "San  Vicente" = "San Vicente",
                     "Santo  Domingo" = "Santo Domingo",
                     "El  Santuario" = "El Santuario",
                     "San  Luis" = "San Luis",
                     "Vigía  del  Fuerte" = "Vigía del Fuerte",
                     "Campo  de  La  Cruz" = "Campo de La Cruz",
                     "Puerto  Colombia" = "Puerto Colombia",
                     "Santo  Tomás" = "Santo Tomás",
                     "Bogotá D C" = "Bogotá D.C.",
                     "Altos  del  Rosario" = "Altos del Rosario",
                     "El  Guamo" = "El Guamo",
                     "El  Peñón" = "El Peñón",
                     "María  la  Baja" = "María la Baja",
                     "San  Estanislao" = "San Estanislao",
                     "San  Jacinto" = "San Jacinto",
                     "San  Pablo  de  Borbur" = "San Pablo de Borbur",
                     "Santa  Catalina" = "Santa Catalina",
                     "Santa  Rosa  del  Sur" = "Santa Rosa del Sur",
                     "Talaigua  Nuevo" = "Talaigua Nuevo",
                     "Buena Vista" = "Buena Vista",
                     "La  Uvita" = "La Uvita",
                     "Paz  de  Río" = "Paz de Río",
                     "Puerto  Boyacá" = "Puerto Boyacá",
                     "San  Eduardo" = "San Eduardo",
                     "San  Mateo" = "San Mateo",
                     "Santa  Rosa  de  Viterbo" = "Santa Rosa de Viterbo",
                     "La  Dorada" = "La Dorada",
                     "La  Merced" = "La Merced",
                     "Cartagena  del  Chairá" = "Cartagena del Chairá",
                     "El  Doncello" = "El Doncello",
                     "La  Montañita" = "La Montañita",
                     "San  José  del  Fragua" = "San José del Fragua",
                     " El  Tambo" = " El Tambo",
                     "La  Sierra" = "La Sierra",
                     "La  Vega" = "La Vega",
                     "Puerto  Tejada" = "Puerto Tejada",
                     "San  Sebastián" = "San Sebastián",
                     "Santander  de  Quilichao" = "Santander de Quilichao",
                     "Villa  Rica" = "Villa Rica",
                     "El  Paso" = "El Paso",
                     "Pueblo  Bello" = "Pueblo Bello",
                     "Río  de  Oro" = "Río de Oro",
                     "La  Paz" = "La Paz",
                     "Ciénaga de Oro" = "Ciénaga de Oro",
                     "Planeta  Rica" = "Planeta Rica",
                     "Pueblo  Nuevo" = "Pueblo Nuevo",
                     "San  Andrés  Sotavento" = "San Andrés Sotavento",
                     "Carmen  de  Carupa" = "Carmen de Carupa",
                     "El  Colegio" = "El Colegio",
                     "La  Calera" = "La Calera",
                     "La  Mesa" = "La Mesa",
                     "Carmen  del  Darien" = "Carmen del Darien",
                     "Medio  Atrato" = "Medio Atrato",
                     "Medio  San  Juan" = "Medio San Juan",
                     "Río  Quito" = "Río Quito",
                     "San  Agustín" = "San Agustín",
                     "Santa  María" = "Santa María",
                     "Santa  Marta" = "Santa Marta",
                     "Nueva  Granada" = "Nueva Granada",
                     "Pijiño  del  Carmen" = "Pijiño del Carmen",
                     "Sabanas  de  San  Angel" = "Sabanas de San Angel",
                     "Santa  Bárbara  de  Pinto" = "Santa Bárbara de Pinto",
                     "Castilla  la  Nueva" = "Castilla la Nueva",
                     "El  Calvario" = "El Calvario",
                     "El  Castillo" = "El Castillo",
                     "El  Dorado" = "El Dorado",
                     "La  Macarena" = "La Macarena",
                     "Puerto  Concordia" = "Puerto Concordia",
                     "Puerto  Gaitán" = "Puerto Gaitán",
                     "Puerto  López" = "Puerto López",
                     "Puerto  Lleras" = "Puerto Lleras",
                     "Puerto  Rico" = "Puerto Rico",
                     "San  Carlos  de  Guaroa" = "San Carlos de Guaroa",
                     "San  Juanito" = "San Juanito",
                     "San  Martín" = "San Martín",
                     "Vista  Hermosa" = "Vista Hermosa",
                     "El  Charco" = "El Charco",
                     "El Peñol" = "El Peñol",
                     "El  Tablón  de  Gómez" = "El Tablón de Gómez",
                     "La  Florida" = "La Florida",
                     "La  Llanada" = "La Llanada",
                     "La  Tola" = "La Tola",
                     "Los Andes" = "Los Andes",
                     "San  Bernardo" = "San Bernardo",
                     "San  Lorenzo" = "San Lorenzo",
                     "San  Pablo" = "San Pablo",
                     "San  Pedro  de  Cartago" = "San Pedro de Cartago",
                     "Santa  Bárbara" = "Santa Bárbara",
                     "San  Andrés  de  Tumaco" = "San Andrés de Tumaco",
                     "La  Esperanza" = "La Esperanza",
                     "La  Playa" = "La Playa",
                     "Puerto  Santander" = "Puerto Santander",
                     "San  Calixto" = "San Calixto",
                     "Villa  Caro" = "Villa Caro",
                     "La  Celia" = "La Celia",
                     "La  Virginia" = "La Virginia",
                     "Pueblo  Rico" = "Pueblo Rico",
                     "El  Playón" = "El Playón",
                     "Jesús  María" = "Jesús María",
                     "Palmas  del  Socorro" = "Palmas del Socorro",
                     "Puerto  Wilches" = "Puerto Wilches",
                     "Sabana  de  Torres" = "Sabana de Torres",
                     "San  Andrés" = "San Andrés",
                     "San  Gil" = "San Gil",
                     "San  Joaquín" = "San Joaquín",
                     "San  José  de  Miranda" = "San José de Miranda",
                     "San  Miguel" = "San Miguel",
                     "San  Vicente  de  Chucurí" = "San Vicente de Chucurí",
                     "Santa  Helena  del  Opón" = "Santa Helena del Opón",
                     "Valle de San José" = "Valle de San José",
                     "Los  Palmitos" = "Los Palmitos",
                     "San Juan de Betulia" = "San Juan de Betulia",
                     "San  Luis  de  Sincé" = "San Luis de Sincé",
                     "Santiago de Tolú" = "Santiago de Tolú",
                     "Carmen  de  Apicala" = "Carmen de Apicala",
                     "Valle  de  San  Juan" = "Valle de San Juan",
                     "El  Águila" = "El Águila",
                     "El  Cairo" = "El Cairo",
                     "El  Dovio" = "El Dovio",
                     "La  Victoria" = "La Victoria",
                     "San  Pedro" = "San Pedro",
                     "Cravo  Norte" = "Cravo Norte",
                     "Hato  Corozal" = "Hato Corozal",
                     "La  Salina" = "La Salina",
                     "Paz de Ariporo" = "Paz de Ariporo",
                     "Puerto  Asís" = "Puerto Asís",
                     "Puerto Caicedo" = "Puerto Caicedo",
                     "Puerto  Guzmán" = "Puerto Guzmán",
                     "Valle  de  Guamez" = "Valle de Guamez",
                     "San  Juan  de  Río  Seco" = "San Juan de Río Seco",
                     "San José del Guaviare" = "San José del Guaviare",
                     "Villa  de  San  Diego  de  Ubate" = "Villa de San Diego de Ubate",
                     "Guadalupe " = "Guadalupe")

# Actualizar los nombres en la base de datos
for (old_name in names(mapeo_Municipio)) {
  new_name <- mapeo_Municipio[old_name]
  query <- sprintf('UPDATE Municipios SET Municipio = "%s" WHERE Municipio = "%s"', new_name, old_name)
  dbExecute(Base_Datos, query)
}

# Establecer options(max.print) en un valor alto para que no haya límite de impresión
options(max.print = 99999)


# Consulta para ver los valores únicos en el campo "Municipio" después de la normalización
nuevos_valores_unicos_Municipio <- dbGetQuery(Base_Datos, "SELECT DISTINCT Municipio FROM Municipios")
# Imprimir los nuevos valores únicos
print(nuevos_valores_unicos_Municipio)                         

# Definir la consulta SQL para actualizar la Superficie para el municipio Mapiripana
query <- "UPDATE Municipios SET Superficie = 7035 WHERE Municipio = 'Mapiripana'"

# Ejecutar la consulta
dbExecute(Base_Datos, query)


# Consulta para obtener el valor actualizado de Superficie para el municipio Mapiripana
query <- "SELECT Superficie FROM Municipios WHERE Municipio = 'Mapiripana'"

# Ejecutar la consulta
resultado <- dbGetQuery(Base_Datos, query)

# Verificar si se obtuvo un resultado no vacío
if (!is.na(resultado$Superficie) && nrow(resultado) > 0) {
  cat("El valor de Superficie para el municipio Mapiripana es:", resultado$Superficie)
} else {
  cat("No se encontró el registro para el municipio Mapiripana.")
}

# Definir la consulta SQL para actualizar los valores incorrectos
consulta_sql <- "
UPDATE Prestadores 
SET depa_nombre = 
  CASE 
    WHEN depa_nombre = 'Barranquilla' THEN 'Atlántico'
    WHEN depa_nombre = 'Cartagena' THEN 'Bolívar'
    WHEN depa_nombre = 'Bogotá D.C' THEN 'Bogotá D.C.'
    WHEN depa_nombre = 'Santa Marta' THEN 'Magdalena'
    WHEN depa_nombre = 'San Andrés y Providencia' THEN 'San Andrés'
    WHEN depa_nombre = 'Valle del cauca' THEN 'Valle Del Cauca'
    WHEN depa_nombre = 'Valle del Cauca' THEN 'Valle Del Cauca'
    WHEN depa_nombre = 'Buenaventura' OR depa_nombre = 'Cali' THEN 'Valle Del Cauca'
    ELSE depa_nombre
  END
WHERE depa_nombre IN ('Barranquilla', 'Cartagena', 'Bogotá D.C', 'Santa Marta', 'San Andrés y Providencia', 'Valle del cauca', 'Valle del Cauca', 'Buenaventura', 'Cali')
"

# Ejecutar la consulta SQL en la base de datos
resultado <- dbExecute(Base_Datos, consulta_sql)

# Verificar el número de filas afectadas por la actualización
print(resultado)




num_registros <- dbGetQuery(Base_Datos, "SELECT COUNT(*) FROM Municipios")

resumen_superficie <- dbGetQuery(Base_Datos, "SELECT MIN(Superficie), MAX(Superficie), AVG(Superficie), MEDIAN(Superficie) FROM Municipios")

registros_nulos <- dbGetQuery(Base_Datos, "SELECT COUNT(*) FROM Municipios WHERE Superficie IS NULL")

print(num_registros)
print(resumen_superficie)
print(registros_nulos)


# Conteo de registros por valor único en un campo
conteo_depa_nombre <- dbGetQuery(Base_Datos, "SELECT depa_nombre, COUNT(*) AS num_registros FROM Prestadores GROUP BY depa_nombre")

# Resumen estadístico de campos numéricos
resumen_numerico <- dbGetQuery(Base_Datos, "SELECT 
                                            MIN(telefono) AS min_telefono, 
                                            MAX(telefono) AS max_telefono, 
                                            AVG(telefono) AS avg_telefono, 
                                            COUNT(*) AS num_registros 
                                          FROM Prestadores")

# Resumen de campos de fecha
resumen_fechas <- dbGetQuery(Base_Datos, "SELECT 
                                          MIN(fecha_radicacion) AS min_fecha_radicacion, 
                                          MAX(fecha_radicacion) AS max_fecha_radicacion, 
                                          COUNT(*) AS num_registros 
                                        FROM Prestadores")

# Conteo de registros habilitados y no habilitados
conteo_habilitado <- dbGetQuery(Base_Datos, "SELECT habilitado, COUNT(*) AS num_registros FROM Prestadores GROUP BY habilitado")

# Conteo de registros por nivel de prestador o caracter
conteo_nivel <- dbGetQuery(Base_Datos, "SELECT nivel, COUNT(*) AS num_registros FROM Prestadores GROUP BY nivel")
conteo_caracter <- dbGetQuery(Base_Datos, "SELECT caracter, COUNT(*) AS num_registros FROM Prestadores GROUP BY caracter")

# Imprimir resultados
print(conteo_depa_nombre)
print(resumen_numerico)
print(resumen_fechas)
print(conteo_habilitado)
print(conteo_nivel)
print(conteo_caracter)


# Cargar datos desde la base de datos
Prestadores <- dbGetQuery(Base_Datos, "SELECT * FROM Prestadores")

# Resumen de los datos
resumen1 <- Prestadores %>%
  group_by(muni_nombre, depa_nombre, nits_nit) %>%
  summarize(num_prestadores = n())


# Cargar los paquetes necesarios para Resúmenes descriptivos
library(summarytools)  # Para resúmenes descriptivos

# Realizar análisis descriptivo para la tabla "Municipios"
datos_municipios <- dbReadTable(Base_Datos, "Municipios")
descr_municipios <- descr(datos_municipios)
print("Resumen descriptivo para la tabla 'Municipios':")
print(descr_municipios)

# Realizar análisis descriptivo para la tabla "Prestadores"
datos_prestadores <- dbReadTable(Base_Datos, "Prestadores")
descr_prestadores <- descr(datos_prestadores)
print("Resumen descriptivo para la tabla 'Prestadores':")
print(descr_prestadores)




library(ggplot2)

# Resumen de los datos por departamento
resumen_departamento <- resumen1 %>%
  group_by(depa_nombre) %>%
  summarize(total_prestadores = sum(num_prestadores))

# Graficar
ggplot(resumen_departamento, aes(x = depa_nombre, y = total_prestadores)) +
  geom_line() +
  geom_point() +
  labs(title = "Total de Prestadores por Departamento",
       x = "Departamento",
       y = "Total de Prestadores") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Resumen de los datos
resumen2 <- Prestadores %>%
  group_by(muni_nombre, depa_nombre, clpr_nombre, nits_nit) %>%
  summarize(num_prestadores2 = n())

# Resumen de los datos por departamento y categoría Tipo de prestador
resumen_categoria <- resumen2 %>%
  group_by(depa_nombre, clpr_nombre) %>%
  summarize(total_prestadores2 = sum(num_prestadores2))

# Graficar
ggplot(resumen_categoria, aes(x = depa_nombre, y = total_prestadores2, fill = clpr_nombre)) +
  geom_bar(stat = "identity") +
  labs(title = "Total de Prestadores por Departamento y Categoría",
       x = "Departamento",
       y = "Total de Prestadores",
       fill = "Categoría") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# Calcular el resumen de la tabla "Municipios"
resumen_municipios <- dbGetQuery(Base_Datos, "SELECT Departamento, SUM(Superficie) AS superficie_total FROM Municipios GROUP BY Departamento")

# Calcular el resumen de la tabla "Prestadores"
resumen_prestadores <- dbGetQuery(Base_Datos, "SELECT depa_nombre, COUNT(DISTINCT nits_nit) AS num_prestadores FROM Prestadores GROUP BY depa_nombre")

# Combinar los resúmenes en un solo marco de datos
resumen_combinado <- merge(resumen_municipios, resumen_prestadores, by.x = "Departamento", by.y = "depa_nombre", all = TRUE)

# Renombrar las columnas para mayor claridad
colnames(resumen_combinado) <- c("Departamento", "Superficie_total", "Num_prestadores")

# Visualizar el resumen combinado
print(resumen_combinado)


# Resumen de los datos
resumen3 <- Prestadores %>%
  group_by(muni_nombre, depa_nombre, clase_persona, nits_nit) %>%
  summarize(num_prestadores3 = n())

# Resumen de los datos por departamento y Personería Jurídica
resumen_categoria <- resumen3 %>%
  group_by(depa_nombre, clase_persona) %>%
  summarize(total_prestadores3 = sum(num_prestadores3))

# Graficar
ggplot(resumen_categoria, aes(x = depa_nombre, y = total_prestadores3, fill = clase_persona)) +
  geom_bar(stat = "identity") +
  labs(title = "Total de Prestadores por Departamento Personería Jurídica",
       x = "Departamento",
       y = "Total de Prestadores",
       fill = "Categoría") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Graficar
ggplot(resumen_categoria, aes(x = "", y = total_prestadores3, fill = clase_persona)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Total de Prestadores por Departamento Personería Jurídica",
       x = "",
       y = "Total de Prestadores",
       fill = "Categoría") +
  theme_void() +
  theme(legend.position = "right")


# Resumen de los datos
resumen4 <- Prestadores %>%
  group_by(muni_nombre, depa_nombre, naju_nombre, nits_nit) %>%
  summarize(num_prestadores4 = n())

# Resumen de los datos por departamento y Naturaleza Administrativa
resumen_categoria <- resumen4 %>%
  group_by(depa_nombre, naju_nombre) %>%
  summarize(total_prestadores4 = sum(num_prestadores4))

# Graficar
ggplot(resumen_categoria, aes(x = depa_nombre, y = total_prestadores4, fill = naju_nombre)) +
  geom_bar(stat = "identity") +
  labs(title = "Total de Prestadores por Departamento Personería Jurídica",
       x = "Departamento",
       y = "Total de Prestadores",
       fill = "Categoría") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Graficar
ggplot(resumen_categoria, aes(x = "", y = total_prestadores4, fill = naju_nombre)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Total de Prestadores por Departamento Naturaleza administrativa",
       x = "",
       y = "Total de Prestadores",
       fill = "Categoría") +
  theme_void() +
  theme(legend.position = "right")
