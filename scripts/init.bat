@echo off
echo �f�[�^�x�[�X�ƃR���e���c�����������܂��B����������߂�ꍇ�� CTRL-C �������Ă�������
pause
docker exec -it badtodo-apache /var/www/clean.sh
docker exec -it badtodo-db /bin/sh -c "mysql -u root -pwasbook </docker-entrypoint-initdb.d/create-tables.sql"
