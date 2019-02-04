<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFournisseursTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fournisseurs', function (Blueprint $table) {
            $table->increments('id_fournisseur');
            $table->timestamps();
            $table->string('nom_fournisseur', 100);
            $table->string('numero_rue', 100)->nullable();
            $table->string('rue', 100)->nullable();
            $table->string('ville', 100)->nullable();
            $table->integer('code_postal')->nullable();
            $table->string('mail', 100)->nullable()->unique();
            $table->string('tel_fournisseur', 15)->nullable();
            $table->string('tel_contact', 15)->nullable();
            $table->string('nom_contact', 100)->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fournisseurs');
    }
}
