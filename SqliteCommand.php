<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class SqliteCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:sqlite';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'quick build database by sqlite';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $file = base_path('database/database.sqlite');
        touch($file);
        $this->changeEnvironment('DB_CONNECTION', 'sqlite');
        $this->commentEnvironment('DB_DATABASE');
    }

    /**
     * change a environment value.
     *
     * @param  string  $key
     * @return void
     */
    protected function changeEnvironment($key, $value)
    {
        file_put_contents($this->laravel->environmentFilePath(), preg_replace(
            $this->replacementPattern($key),
            "$key=$value",
            file_get_contents($this->laravel->environmentFilePath())
        ));
    }

    /**
     * Get a regex pattern that will match env APP_KEY with any random key.
     *
     * @return string
     */
    protected function replacementPattern($key)
    {
        $escaped = preg_quote('='.env($key), '/');

        return "/^$key{$escaped}/m";
    }

    /**
     * comment a environment value.
     *
     * @param  string  $key
     * @return void
     */
    protected function commentEnvironment($key)
    {
        $replacement = $this->replacementPattern($key);
        file_put_contents($this->laravel->environmentFilePath(), preg_replace(
            $replacement,
            '# ${0}',
            file_get_contents($this->laravel->environmentFilePath())
        ));
    }
}
