@echo off
echo Nginx�̃L���b�V�������ׂč폜���܂��B�L���b�V���̍폜����߂�ꍇ�� CTRL-C �������Ă�������
pause
docker exec -it badtodo-nginx /bin/sh -c "rm /var/cache/nginx/*"
