# learningmachine
**Comandos git**<br/><br/>

**git init**<br/> 
inicia el repositorio ne modo local.<br/><br/>

**git clone "url"**<br/>
Clona un repositorio desde la red ya sea propio o de otra persona.<br/><br/>

**git config --global variable**<br/>
**user.name nombre** Cambia el nombre de usuario de manera global para el repositorio actual y futuros creados.<br/>
**user.email email** Cambia el emai de un usuario de manera global para el repositorial y futuros creados.<br/> 
**-e** Nos muestra el fichero de configuración global y nos permite editarlo.<br/>
**init.defaultbranch nombredelabranch** Cambia de manera global el nombre de la rama principal para este y futuros repositorios.<br/><br/>

**git status**<br/> 
Muestra el estado actual con información detallada sobre el estado actual.<br/>

**git add variable**<br/>
**fichero** Añade un fichero determinado.<br/>
**.** Añade todos los ficheros.<br/><br/>

**git checkout variable**<br/>
**--** Restaura todos los ficheros al último commit.<br/>
**-b nombre** Crea una rama nueva y cambia a ella.<br/><br/>

**git branch variable**<br/> 
**Sin variable** nos muestra la branch en la que estamos trabajando.<br/>
**nombrerama** Crea una rama nueva, pero no cambia a ella, solo la crea.<br/><br/>

**git log**<br/> 
Muestra el log.<br/><br/>

**git rebase rama**<br/>
Nos permite solucionar conflictos en los pull request cuando el merge es diferente entre ramas.<br/><br/>

**git reset variable**<br/> 
**--soft HEAD~1** Vuelve a un commit anterior, se puede retroceder mas commits cambiando el valor de head.<br/>