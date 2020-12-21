#check Bitrix-env

echo Search for Bitrix-Env...
if [ ! -d "/opt/webdir" ]; then
  echo Install Bitrix-Env...
  chmod -R 777 /home/bitrix/www
  bash -c /opt/bitrix-env.sh
  chown -R bitrix:bitrix /home/bitrix/www
  chmod -R 755 /home/bitrix/www
  else
  echo Bitrix-Env already installed.
fi

#Check XDebug
  if [ -e /etc/php.d/15-xdebug.ini.disabled ]; then
    echo zend_extension=xdebug.so > /etc/php.d/15-xdebug.ini
    echo xdebug.remote_enable=1 >> /etc/php.d/15-xdebug.ini
    mv /etc/php.d/15-xdebug.ini.disabled /etc/php.d/15-xdebug.ini.help
    echo XDebug enabled
    else
    echo XDebug already enabled.
  fi