# aaPanel Docker Deployment

1.  
**Créer et éditer le script**
 `nano aa.sh ` 
 
2.  
**Copiez et collez le script https://raw.githubusercontent.com/trh4ckn0n/aaPanel/refs/heads/master/aa.sh**.

```
curl -sSL https://raw.githubusercontent.com/trh4ckn0n/aaPanel/refs/heads/master/aa.sh | bash
```

```
wget -qO- https://raw.githubusercontent.com/trh4ckn0n/aaPanel/refs/heads/master/aa.sh | bash
```

```
wget -O aa.sh https://raw.githubusercontent.com/trh4ckn0n/aaPanel/refs/heads/master/aa.sh
chmod +x aa.sh
./aa.sh
```
 
3.  
**Rendre le script exécutable**
 `chmod +x aa.sh ` 
 
4.  
**Lancer le script**
 `./aa.sh ` 
 

The docker image is officially released by aaPanel

Maintained by: [aaPanel](https://www.aapanel.com)



## How to use

```
docker run -d -p 8886:8888 -p 22:21 -p 443:443 -p 80:80 -p 889:888 -v ~/website_data:/www/wwwroot -v ~/mysql_data:/www/server/data -v ~/vhost:/www/server/panel/vhost aapanel/aapanel:lib
```

Now you can access aaPanel at http://youripaddress:8886/ from your host system.

Default username:`aapanel`

Default password:`aapanel123`

####Port usage analysis
Control Panel   : 8888
Phpmyadmin      : 888

####Dir usage analysis
Website data    : /www/wwwroot
Mysql data      : /www/server/data
Vhost file      : /www/server/panel/vhost 

**Note: after the deployment is complete, please immediately modify the user name and password in the panel settings and add the installation entry**

test
