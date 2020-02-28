<?php
require 'recipe/common.php';

function run_output($cmd) {
    $output = run($cmd);
    write($output);
}

set('repository', 'git@git.coding.net:entimm/hm.git');

server('midollar', 'midollar.biz')
    ->user('root')
    ->identityFile()
    ->port('29730')
    ->env('deploy_path', '/var/www');

task('pull:test', function() {
    writeln('deploy test...');
    cd('/var/www/hm_test');
    write('Current dir:');
    run_output('pwd');
    run_output('sudo -Hu www-data git reset --hard');
    run_output('sudo -Hu www-data git pull');
});

task('pull:prod', function() {
    writeln('deploy prod...');
    cd('/var/www/hm_prod');
    write('Current dir:');
    run_output('pwd');
    run_output('sudo -Hu www-data git reset --hard');
    run_output('sudo -Hu www-data git pull');
});

task('pull:new', function() {
    writeln('deploy new...');
    cd('/var/www/hm_new');
    write('Current dir:');
    run_output('pwd');
    run_output('sudo -Hu www-data git reset --hard');
    run_output('sudo -Hu www-data git pull');
});

task('pull', [
    'pull:test',
    'pull:prod',
]);

task('download', function() {
    download('../hm/settings.test.php', '/var/www/hm_test/settings.test.php');
    download('../hm/settings.prod.php', '/var/www/hm_test/settings.prod.php');
});

// sudo service nginx configtest
// https://certbot.eff.org/#ubuntuxenial-nginx
task('new-https', function() {
    run_output('service nginx stop');
    run_output('certbot certonly --standalone -d midollar.biz -d www.midollar.biz -d test.midollar.biz -d theme.midollar.biz');
    run_output('service nginx start');
});

task('renew-https', function() {
    run_output('certbot renew --dry-run');
});