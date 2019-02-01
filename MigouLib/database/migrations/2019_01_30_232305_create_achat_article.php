<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAchatArticle extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('achat_article', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('id_article')->unsigned();
            $table->integer('id_achat')->unsigned();
            $table->integer('quantite');
            $table->integer('remise_forfaitaire')->nullable();
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('achat_article');
    }
}
