<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->increments('id_client');
            $table->timestamps();
            $table->string('nom', 100);
            $table->string('prenom', 100);
            $table->string('raison_sociale', 100)->nullable();
            $table->string('numero_rue', 100)->nullable();
            $table->string('rue', 100)->nullable();
            $table->string('ville', 100)->nullable();
            $table->tinyInteger('code_postal')->nullable();
            $table->tinyInteger('age')->nullable();
            $table->string('sexe', 100)->nullable();
            $table->string('mail', 100)->nullable()->unique();
            $table->string('tel_fixe', 15)->nullable();
            $table->string('tel_mobile', 15)->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clients');
    }
}
