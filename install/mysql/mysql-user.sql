use mysql;
grant all privileges on useraccount.* to useraccount@'%' identified by 'mypassword';
flush privileges;

