<?php
declare(strict_types=1);
$cfg['blowfish_secret'] = '';
/* Конфигурация сервера */
$i = 0;
/* Создаем сервер */
$i++;
/* Тип аутентификации */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Параметры сервера */
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
/* Директории для сохранения/загрузки файлов с сервера */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
