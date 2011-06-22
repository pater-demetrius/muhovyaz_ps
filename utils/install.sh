#!/bin/sh

CURRENT_DIR='/usr/local/www/web-install'
UNIT_TESTS_DIR='/usr/local/www/unit-tests'
DOC_ROOT='/data/web/vilavi.com'
MLM_MOD_PATH="$DOC_ROOT/kernel/data/mlm/"

APACHE_USER="www"
APACHE_GROUP="www"
DB_USER='vilaviweb'
DB_PASS='XXTz7cMcFsqYJdcS'

DEST_DIR='svn-source'
DATA_DIR='data'
MLM_MOD_DEST_DIR="$DEST_DIR/module/src"
SVN="svn --no-auth-cache --username buildbot --password repy,Tw"
SVN_SERVER="svn://dev.cbrgroup.ru"
SVN_COMMAND="checkout" # checkout or export
MLM_COMPILE_COMMAND="compile.sh"
BRANCH="trunk"


cd $CURRENT_DIR

# checkout from SVN
rm -rf $DEST_DIR
echo "Get source from SVN..."
$SVN $SVN_COMMAND $SVN_SERVER/mlm/$BRANCH/ $DEST_DIR

SVN_REVISION=`$SVN info $SVN_SERVER/mlm/$BRANCH | grep "Revision:" | awk '{ print $2 }'`
echo -n "$SVN_REVISION" > $DEST_DIR/src/.revision

# remove all .svn files
find $DEST_DIR -name ".svn" | xargs rm -rf

# modify config
cd $CURRENT_DIR

sed -i '' \
    -e "s|dbLogin.*|dbLogin = $DB_USER|g" \
    -e "s|dbPasswd.*|dbPasswd = $DB_PASS|g" \
    -e 's|^\s*WSDLUrl.*|WSDLUrl = "http://mail.stack.ru:85/antiagews/AntiAgeService.asmx?WSDL"|g' \
    -e 's|www.vilavi.com|www.dev.cbrgroup.ru|g' \
    -e 's|office.vilavi.com|office.dev.cbrgroup.ru|g' \
    -e 's|shop.vilavi.com|shop.dev.cbrgroup.ru|g' \
    -e 's|callcenter.vilavi.com|callcenter.dev.cbrgroup.ru|g' \
    -e 's|technicalEmail.*|technicalEmail = ""|g' \
    -e 's|paymentReportEmail.*|paymentReportEmail = "krotov.alex@gmail.com"|g' \
    -e 's|technicalSMSPhone.*|technicalSMSPhone = ""| g' \
    -e 's|logisticSMSPhone.*|logisticSMSPhone = ""|g' \
    -e 's|reminderNotificationEmails.*|reminderNotificationEmails = ""|g' $DEST_DIR/src/kernel/etc/Kernel.conf

sed -i -e 's|vilavi.com|dev.cbrgroup.ru|g' $DEST_DIR/src/office/index.php # not needed anymore

sed -i '' \
    -e 's|^\s*paymentUrl_default.*|paymentUrl_default = "https://playground.paymentgate.ru/bpcservlet/Merchant2Rbs"|g' \
    -e 's|^\s*queryOrderUrl_default.*|queryOrderUrl_default = "https://playground.paymentgate.ru/bpcservlet/QueryOrders"|g' \
    -e 's|^\s*acceptPaymentUrl_default.*|acceptPaymentUrl_default = "https://playground.paymentgate.ru/bpcservlet/BPC/AcceptPayment.jsp"|g' \
    -e 's|^\s*MERCHANTNUMBER_default.*|MERCHANTNUMBER_default = "118600118603000118604"|g' \
    -e 's|^\s*MERCHANTPASSWD_default.*|MERCHANTPASSWD_default = "lazY2k"|g' $DEST_DIR/src/kernel/share/apps/Price/Price.conf

# prepare other files
mkdir -p $DEST_DIR/src/kernel/var/tmp
mkdir -p $DEST_DIR/src/kernel/data
mkdir -p $DEST_DIR/src/logs

echo "Compile MLM module..."
cd $MLM_MOD_DEST_DIR
chmod 744 $MLM_COMPILE_COMMAND
./$MLM_COMPILE_COMMAND
if [ "$?" -ne "0" ]; then 
  echo "##########################" 
  echo "Some errors were occured during compiling MLM module!" 
  echo "##########################" 
  exit 1
fi


# Prepare database
cd $CURRENT_DIR
./mysql_backup_tool --restore vilaviweb --file $DATA_DIR/vilaviweb.sql --force
echo "Clear users data..."
echo "UPDATE \`vilaviweb\`.\`users\` SET \`userEmail\` = '', \`userPassword\` = MD5('demo');" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '' WHERE \`varName\` = 'userEmail';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '' WHERE \`varName\` = 'suprugEmail';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '0' WHERE \`varName\` = 'residencePhone';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '0' WHERE \`varName\` = 'userMobile';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '0' WHERE \`varName\` = 'userPhone';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '0' WHERE \`varName\` = 'suprugMobile';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "UPDATE \`vilaviweb\`.\`userVars\` SET \`varValue\` = '0' WHERE \`varName\` = 'suprugPhone';" | mysql -u$DB_USER -p$DB_PASS vilaviweb
echo "Done!"

#Make doc root
echo "Replace old code..."
rm -rf $DOC_ROOT
cd $CURRENT_DIR
mv $DEST_DIR/src $DOC_ROOT

#Copy images
echo "Copy images..."
tar -xvf $CURRENT_DIR/data/i.tgz -C $DOC_ROOT/www/

#installing mlm module
mkdir -p $MLM_MOD_PATH

mkdir $MLM_MOD_PATH/LOG
chmod 774 $MLM_MOD_PATH/LOG

mkdir $DOC_ROOT/LOG
chmod 774 $DOC_ROOT/LOG

cp $MLM_MOD_DEST_DIR/a.out $MLM_MOD_PATH/a.out
chmod 744 $MLM_MOD_PATH/a.out
cp $MLM_MOD_DEST_DIR/mlm.cfg $MLM_MOD_PATH/mlm.cfg
cp $MLM_MOD_DEST_DIR/mlm4.cfg $MLM_MOD_PATH/mlm4.cfg

# replace windows style newlines
sed -i '' -e 's|$||' \
		  -e "s|DB_USER.*|DB_USER $DB_USER|g" \
		  -e "s|DB_PASS.*|DB_PASS $DB_PASS|g" $MLM_MOD_PATH/mlm.cfg
sed -i '' -e 's|$||' \
		  -e "s|DB_USER.*|DB_USER $DB_USER|g" \
		  -e "s|DB_PASS.*|DB_PASS $DB_PASS|g" $MLM_MOD_PATH/mlm4.cfg

#Apply patches
echo "Apply patches to database..."
$DOC_ROOT/kernel/migrate.php
if [ "$?" -ne "0" ]; then 
  echo "##########################" 
  echo "Some errors were occured during migration, please check logs!" 
  echo "##########################" 
  exit 1
fi
echo "Done!"

chown -R $APACHE_USER:$APACHE_GROUP $DOC_ROOT

#Copy unit tests
echo "Copy unit tests..."
rm -rf $UNIT_TESTS_DIR
cd $CURRENT_DIR
mv $DEST_DIR/tests/unit $UNIT_TESTS_DIR
chown -R $APACHE_USER:$APACHE_GROUP $UNIT_TESTS_DIR
chmod 755 $UNIT_TESTS_DIR/phpunit.php

echo "##########################" 
echo "Installation done!" 

#Execute unit tests
echo "##########################" 
echo "Execute unit tests..." 
sudo -u $APACHE_USER $UNIT_TESTS_DIR/phpunit.php VilaviTests > $UNIT_TESTS_DIR/results.txt

exit 0
