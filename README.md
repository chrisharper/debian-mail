About
=====

Docker-compose ( https://docs.docker.com/compose/ ) based mailserver with flat file user management and Maildir
storage. Utilising debian,exim4, dovecot, spamassassin ,dkim and spamassassin.

Mail is stored in a data container (http://docs.docker.com/v1.8/userguide/dockervolumes/)

Authentication is done through dovecot-auth 

Communication is done through sockets stored on /mnt/sockets 

Mail is stored at /mnt/vmail

Logs stored at /mnt/logs


Install Procedure 
=================

Install docker-compose 

Change the domain name from charper.co.uk to yours using the following command in the root of the cloned 
directory:
 
 ```
    find . -type f -print0 | xargs -0 sed -i 's/charper.co.uk/example.com/g'
  ```

Replace the following SSL files with yours
  ```
    dovecot/domain.key -> SSL key
    dovecot/domain.crt -> SSL cert
    exim/domain.key -> SSL key
    exim/domain.crt -> SSL key
    exim/dkim.key -> DKIM key 
  ```
Add users to dovecot/users ,use doveadm pw -s SHA512-CRYPT to generate password and use example formatting

Add aliases to exim/aliases if required

Running 
=======
  ```
    cd debian-mail
    docker-compose build .
    docker-compose up
  ```
Troubleshooting
===============

Logs can be read using
  ```  
    docker-compose logs
  ```
or you can attach another container to the data container and read using normal system tools    

  ```
    docker run --volumes-from DO_NOT_DELETE_data_volume_DO_NOT_DELETE -it debian sh
    cd /mnt/
    ls 
  ```
